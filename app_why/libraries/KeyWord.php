<?php 

/**

 * KeyWord.php

 *

 * 关键字查找

 */

class KeyWord {

	protected $mKeyWordDict;
	protected $mCompileDict;
	public $mContent = array();
	public $mCacheFile;
	/**

	 * 构造函数 

	 * 

	 * @param mixed $keyWord 可以是一个文件地址也可以是一个关键词的数组

	 * @param mixed $cacheFilre 

	 * @access public

	 * @return void

	 */

	public function __construct($params) {
		$keyWord = isset($params['keyWord'])?$params['keyWord']:NULL;
		$cacheFile = isset($params['cacheFile'])?$params['cacheFile']:NULL;

		$dir = substr($cacheFile, 0, strrpos($cacheFile, '/'));

		if(is_dir($dir) && is_writeable($dir))

			$this->mCacheFile = $cacheFile;



		if(is_array($keyWord))

		{

			$this->mKeyWordDict = $keyWord;

			$this->compile();

		}

		else if(file_exists($cacheFile))

		{

			$this->mContent = require_once($cacheFile);

		}

		else if(file_exists($keyWord))

		{

			$this->mKeyWordDict = require_once($keyWord);

			$this->compile();

		}

		else

			$error='Wrong keyWord to support';

	}



	/**

	 * 关键词按字节的ACCSII码做为KEY分成N维数组 

	 * 

	 * @access private

	 * @return void

	 */

	private function compile()

	{

		$cWord = array();

		foreach($this->mKeyWordDict as $v)

		{

			$temp = '$cWord';

			$len = strlen($v);

			for($i = 0; $i < $len; $i++)

			{

				$temp .= '[\'key\'][\'' . $v{$i} . '\']';

			}

			eval($temp .= '[\'val\'] = 1;');

		}



        if($this->mCacheFile)

		{

        	$fp = fopen($this->mCacheFile, 'wb');

        	fwrite($fp, '<?php' . "\n" . 'return ' . var_export($cWord, 1) . ';');

			fclose($fp);

        }



		$this->mContent = $cWord;

		return $this->mContent;

	}



	/**

     * 递归查找指定位置是否有关键词

	 * 

	 * @param mixed $ori 

	 * @param mixed $i 

	 * @param int $pos 

	 * @access private

	 * @return void

	 */

	private function findKeyWord($ori, $content, $i, $pos = 1)

	{

		if($pos > 20) return false;

		if(empty($content)) return false;

		if(isset($ori{$i}) && isset($content['key'][$ori{$i}]['val']) && 

			$content['key'][$ori{$i}]['val'] == 1) return $pos;



		if(!isset($ori{$i}) || empty($content['key'][$ori{$i}]['key'])) return false;

		return $this->findKeyWord($ori, $content['key'][$ori{$i}], $i+1, ++$pos);

		

	}



	/**

	 * 递归找出关键字的起始和结束位置 

	 * 

	 * @param mixed $ori 

	 * @access private

	 * @return void

	 */

	private function goToFind($ori)

	{

		$len = strlen($ori);

		$begin = $end = array();

		for($i = 0; $i < $len; $i++)

		{

			if(($n = $this->findKeyWord($ori, $this->mContent, $i)) !== false)

			{

				$e = $i + $n;

				$begin[] = $i;

				$end[] = $e;

				$i = $e - 1;

			}

		}



		if(!empty($begin) && !empty($end))

			return array($begin, $end);

		else

			return false;

	}



	/**

	 * 判断是否含有关键字 

	 * 

	 * @param mixed $ori 

	 * @access public

	 * @return void

	 */

	public function isKeyWord($ori)

	{

		$isKeyWord = $this->goToFind($ori);

		if($isKeyWord)

			return true;

		else

			return false;

	}



	/**

	 * 对关键字部分进行替换

	 * 

	 * @param mixed $ori 

	 * @param string $repStr 

	 * @access public

	 * @return void

	 */

	public function replace($ori, $repStr = '*') {
		$keyRange = $this->goToFind($ori);

		if($keyRange)

		{

			for($i = 0, $len = sizeof($keyRange[0]); $i < $len; $i++)
			{
				for($j = $keyRange[0][$i]; $j < $keyRange[1][$i]; $j++)
				{
					$ori{$j} = $repStr;
				}
			}
			return $ori;

		}

		else

			return false;

	}



	/**

	 * 高亮关键字 

	 * 

	 * @param mixed $ori 

	 * @param string $color 

	 * @access public

	 * @return void

	 */

	public function hightLight($ori, $color = '#ff0000')

	{

		$keyRange = $this->goToFind($ori);

		if($keyRange)

		{

			for($len = sizeof($keyRange[0]), $i = $len; $i >= 0; $i--)

			{

				$oriLen = strlen($ori);

				if(isset($keyRange[1][$i])) 

					$ori = substr($ori, 0, $keyRange[1][$i]) . '</span>' . 

							substr($ori, $keyRange[1][$i], $oriLen);

				$oriLen = strlen($ori);

				if(isset($keyRange[0][$i]))

					$ori = substr($ori, 0, $keyRange[0][$i]) . '<span style="color:' . $color . '">' . 

							substr($ori, $keyRange[0][$i], $oriLen);

			}

			return $ori;

		}

		else

			return false;

	}

}

