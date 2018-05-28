<?php
/**
 * helps.php
 *
 * 助手类文件
 */

/**
 * 确定验证的方式 
 * 
 * @param mixed $type 
 * @access public
 * @return void
 */
function confirmType($type)
{
	$par = $_GET;
	if($type == 1)
		$par = $_GET;

	if($type == 2)
		$par = $_POST;

	if($type == 3)
		$par = $_REQUEST;

	return $par;
}

/**
 * 模板初始化
 * 
 * @param mixed $tpl 
 * @param mixed $args 
 * @access public
 * @return void
 */
function template($tpl, $args = NULL)
{
	global $_SGLOBAL, $config;
	if(!isset($_SGLOBAL['view']) || !$_SGLOBAL['view'])
	{
		include_once $config['libs'] . './smarty/Smarty.class.php';
		$_SGLOBAL['view'] = new Smarty;

		foreach($config['view'] as $k => $v)
		{
			$_SGLOBAL['view']->$k = $v;
		}
	}
	isset($_SGLOBAL['assign']) && count($_SGLOBAL['assign'])>0 ? $_SGLOBAL['view']->assign($_SGLOBAL['assign']) : '';
	isset($args[1]) ? $_SGLOBAL['view']->assign($args[1]) : '';
	if(!isset($args[0]) || !$args[0])
		$args[0] = 'display';

	return $_SGLOBAL['view']->$args[0]($tpl);
}

function getRandomPass($len=6,$format='ALL',$delsame=false)
{
	switch($format) {
		
		case 'ALL':
			$chars='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'; break;
		case 'CHAR':
			$chars='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'; break;
		case 'NUMBER':
			$chars='0123456789'; break;
		case 'TOLOW':
			$chars='abcdefghijklmnopqrstuvwxyz0123456789';break;
		case 'CHARTOLOW':
			$chars='abcdefghijklmnopqrstuvwxyz';break;
		default :
			$chars='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'; 
		break;
	}
	if ($delsame)
		$chars = 'ABCDEFGHIJKLMNPQRSTUVWXYZ123456789';
	mt_srand((double)microtime()*1000000*getmypid()); 
	$password="";
	while(strlen($password)<$len)
		$password.=substr($chars,(mt_rand()%strlen($chars)),1);
	return $password;
}

/**
 * 添加过滤转义
 * 
 * @param mixed $string 
 * @access public
 * @return void
 */
function saddslashes($string)
{
	if(is_array($string))
	{
		foreach($string as $key => $val)
		{
			$string[$key] = saddslashes($val);
		}
	}
	else
		$string = addslashes($string);

	return $string;
}

/**
 * 去掉slassh 
 * 
 * @param mixed $string 
 * @access public
 * @return void
 */
function sstripslashes($string)
{
	if(is_array($string))
	{
		foreach($string as $key => $val)
		{
			$string[$key] = sstripslashes($val);
		}
	}
	else
		$string = stripslashes($string);

	return $string;
}

/**
 * 查找字符串
 * 
 * @param mixed $haystack 
 * @param mixed $needle 
 * @access public
 * @return void
 */
function strExists($haystack, $needle)
{
	return !(strpos($haystack, $needle) === FALSE);
}

/**
 * 取消HTML代码
 * 
 * @param mixed $string 
 * @access public
 * @return void
 */
function shtmlspecialchars($string)
{
	if(is_array($string))
	{
		foreach($string as $key => $val)
		{
			$string[$key] = shtmlspecialchars($val);
		}
	}
	else
	{
		$string = preg_replace('/&amp;((#(\d{3,5}|x[a-fA-F0-9]{4})|[a-zA-Z][a-z0-9]{2,5});)/', '&\\1',
		str_replace(array('&', '"', '<', '>'), array('&amp;', '&quot;', '&lt;', '&gt;'), $string));
	}
	return $string;
}

/**
 * 验证用户是否登录 
 * 
 * @access public
 * @return void
 */
function checkAuth()
{
	global $config;
	if(isset($_SESSION['auser']) && $_SESSION['auser'] && isset($_SESSION['aprs']) && $_SESSION['aprs'])
	{
		////权限验证
		if(!checkPrivs($_SESSION['aprs']))
			showMessage('对不起，您没有该权限！');
	}
	else
		redirect('index.php');
}

/**
 * 判断管理员是否有该操作权限 
 * 
 * @access public
 * @return void
 */
function checkPrivs($aprs)
{
	global $config;
	//是否为总管理员
	if(in_array($config['adminpr'], $aprs))
		return true;

	//获取当前执行动作(文件名+ac)
	$temp = explode('/', substr($_SERVER['PHP_SELF'], 0, -4));
	$url = end($temp); 
	$ac = isset($_GET['ac']) ? trim($_GET['ac']) : '';
	if(in_array($url ."_all", $aprs) || in_array($url ."_". $ac, $aprs))
		return true;
	else
		return false;
}

/**
 * 登录插入临时表 
 * 
 * @param mixed $info 
 * @access public
 * @return void
 */
function setOnlineInfo($uId, $uName, $uTrueName, $uStatus = 0)
{
	global $_SGLOBAL, $config, $cache;
	//创建cookie
	$authPass = md5($uId . $_SGLOBAL['timestamp']);
	$cookieTime = $uStatus ? 31536000 : '';
	ssetcookie('auth', authCode($authPass . "\t" . $uId, 'ENCODE'), $cookieTime);
	ssetcookie('loginuser', $uName, 31536000);

	//创建登录的session到缓存中，并缓存用户信息
	require_once $config['libs'] . './dal/Dal.php';
	$dal = new Dal();
	$tCache = $dal->initCache($cache['tempCache'], $cache['tempCacheType']);
	$authInfo = array('password' => $authPass, 'lastTime' => $_SGLOBAL['timestamp'], 'userName' => $uName);
	$sql = 'REPLACE INTO ppl_online_users(ub_id, ub_name, ub_truename, ou_lasttime, ou_password)
			VALUES("' . $uId . '", "' . $uName . '", "' . $uTrueName . '", "' . $_SGLOBAL['timestamp'] . '", "' . $authPass . '")';
	//将登录信息写入临时表
	$qCache = $dal->initCache($cache['permCache'], $cache['permCacheType']);
	if($tCache->set('user:auth:' . $uId, $authInfo, $config['keepAlive']) === false)
	{
		global $db;
		require_once $config['libs'] . './DaChoose.php';
		$dc = new DaChoose($db);
		$dbObj = $dal->initDb($dc->setModule('common')->setAction('w')->getConfig());
		$dbObj->query($sql);
	}
	else
		$qCache->rpush('user:online:list', $sql);

	//将用户id写入排行队列
	$qCache->rpush('RankRequest', $uId);
}
/**
 * 清空cookie
 * 
 * @access public
 * @return void
 */
function clearcookie()
{
	/*
	ssetcookie('auth', '', -86400 * 365);
	$_SGLOBAL['supeUid'] = 0;
	$_SGLOBAL['supeUsername'] = '';
	*/
	ssetcookie('auser',  '', -86400 * 365);
	ssetcookie('aprs', '', -86400 * 365);
}

/**
 * 判断提交是否正确
 * 
 * @param mixed $var 
 * @access public
 * @return void
 */
function submitCheck($var)
{
	if(!empty($_POST[$var]) && $_SERVER['REQUEST_METHOD'] == 'POST')
	{
		if((empty($_SERVER['HTTP_REFERER']) || preg_replace("/https?:\/\/([^\:\/]+).*/i", "\\1", $_SERVER['HTTP_REFERER']) == preg_replace("/([^\:]+).*/", "\\1", $_SERVER['HTTP_HOST'])))
			return true;
		else
			showMessage('非法提交');
	}
	else
		return false;
}

/**
 * 产生form防伪码
 * 
 * @access public
 * @return void
 */
function formHash()
{
	global $_SGLOBAL, $config;
	if(empty($_SGLOBAL['formhash']))
		//$_SGLOBAL['formhash'] = substr(md5(substr($_SGLOBAL['timestamp'], 0, -7).'|'.$_SGLOBAL['supeUid'].'|'.md5($config['pplKey'])), 8, 8);
		$_SGLOBAL['formhash'] = substr(md5(substr($_SGLOBAL['timestamp'], 0, -7).'|'.md5($config['pplKey'])), 8, 8);

	return $_SGLOBAL['formhash'];
}

/**
 * 验证验证码 
 * 
 * @param mixed $code 
 * @access public
 * @return void
 */
function checkSecCode($code)
{
	global $config;
	require_once $config['libs'] . './seccode/SecCode.php';
	return SecCode::check($code);
}

/**
 * 设置对话框 
 * 
 * @param mixed $message 
 * @param string $urlForward 
 * @param int $second 
 * @param int $inajaxErr 
 * @access public
 * @return void
 */
function showMessage($message, $urlForward = '', $second = 1, $inajaxErr = 0)
{
	global $config, $_SCONFIG, $_SGLOBAL,$assign;
	//显示
	if(empty($_SGLOBAL['inajax']) && $urlForward && empty($second))
	{
		header("HTTP/1.1 301 Moved Permanently");
		header("Location: $urlForward");
	}
	else
	{
		if($_SGLOBAL['inajax'])
		{
			$rMsg = array('msg' => $message);
			$inajaxErr == 1 ? $rMsg['err'] = 1 : '';
			if($urlForward)
				$rMsg['forward'] = $urlForward;

			echo json_encode($rMsg);
		}
		else
		{
			if($urlForward && $urlForward != 'prepage')
				$message = "<a href=\"$urlForward\">$message</a><script>setTimeout(\"window.location.href ='$urlForward';\", ".($second*1000).");</script>";
			if($urlForward && $urlForward == 'prepage')
				$message = "$message<script>setTimeout(\"window.history.go(-1);\", ".($second*1000).");</script>";
			if($urlForward && $urlForward == 'prepage2')
				$message = "$message<script>setTimeout(\"window.history.go(-2);\", ".($second*1000).");</script>";

			template('showmessage.tpl', array('display', array('message' => $message, 'urlForward' => $urlForward,'gmsdbargname'=>$assign['gmsdbargname'],'curchnelname'=>$assign['curchnelname'],'user'=>$assign['user'])));
		}
	}
	exit();
}

/**
 * cookie设置
 * 
 * @param mixed $var 
 * @param mixed $value 
 * @param int $life 
 * @access public
 * @return void
 */
function ssetcookie($var, $value, $life=0)
{
	global $_SGLOBAL, $_SERVER, $config;
	setcookie($config['cookiePre'].$var, $value, $life ? ($_SGLOBAL['timestamp'] + $life) : 0,  
			$config['cookiePath'], $config['cookieDomain'], $_SERVER['SERVER_PORT'] == 443 ? 1 : 0);
	setcookie($config['cookiePre'].$var, $value, $life ? ($_SGLOBAL['timestamp'] + $life) : 0,
			$config['cookiePath'], '', $_SERVER['SERVER_PORT'] == 443 ? 1 : 0);
	setcookie($var, $value, $life ? $life : 0);
}

function ssession($var, $value)
{
	$_SESSION[$var] = $value;
}


/**
 * 判断邮箱
 * 
 * @param mixed $email 
 * @access public
 * @return void
 */
function checkEmail($email) 
{
	return strlen($email) > 6 && preg_match("/^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/", $email);
}

/**
 * 判断网址 
 * 
 * @param mixed $weburl 
 * @access public
 * @return void
 */
function checkWebAddr($weburl)
{
	return preg_match("/^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"])*$/",$weburl);
}
/**
 * 获取道具图标文件名 
 * 
 * @param mixed $id 
 * @param mixed $ext 
 * @access public
 * @return void
 */
function getImageName($id, $ext = 'png')
{
	return $ext ? substr(md5($id), 8, 16) . '.' . $ext : substr(md5($id), 8, 16);
}

/**
 * 获取avatar图片路径
 * 
 * @param mixed $avatar 
 * @param mixed $avatarRoot 
 * @param mixed $ext 
 * @access public
 * @return void
 */
function getAvatarImageDir($avatar, $avatarRoot = NULL, $ext = NULL)
{
	$md = getImageName($avatar, '');
	$r = $avatarRoot . substr($md, 0, 2) . DIRECTORY_SEPARATOR . substr($md, 2, 2) . DIRECTORY_SEPARATOR . substr($md, 4, 2) . DIRECTORY_SEPARATOR;
	$ext ? $r .= $md . '.' . $ext : '';
	return $r;
}

/**
 * 创建avatar图片路径 
 * 
 * @param mixed $avatar 
 * @access public
 * @return void
 */
function mkAvatarImageDir($avatar, $avatarRoot)
{
	$str = getImageName($avatar, '');
	$dir = $avatarRoot;
	$i = 0;
	while($i<5)
	{
		$dir .= substr($str,$i,2) . DIRECTORY_SEPARATOR;
		if(!is_dir($dir)) mkdir($dir);
		$i = $i + 2;
	}

	return $dir;
}

/**
 * 获取道具图片
 * 
 * @param mixed $goodId 
 * @access public
 * @return void
 */
function getImage($id, $type = 1, $sex = 1, $fileType = NULL)
{
	global $config;
	$imageUrl = '';
	if(!$fileType)
		$fileType = $type == 1 ? 'png' : 'jpg';

	// CDN序号 
	if ($type < 4)
		$cdnFlag = 1;
	else if ($type < 7)
		$cdnFlag = 2;
	else
		$cdnFlag = 3;

	//cdn可以后要修改
	$cdnFlag = '';
	$filePath = getAvatarImageDir($id, '', $fileType);
	switch($type)
	{
		case 1://avatar图,为png格式
			if(file_exists($config['avatarDir'] . $filePath)) $imageUrl = 'attachment/avatar/' . $filePath;
			else $imageUrl = $sex == 1 ? 'image/default_boy_avatar.png' : 'image/default_gril_avatar.png';
			break;
		case 2://用户头像,为jpg格式
			if($id == 100001) $imageUrl = 'image/zyj.jpg';
			elseif($id == 100002) $imageUrl = 'image/zyq.jpg';
			else
			{
				if(file_exists($config['pictureDir'] . $filePath)) $imageUrl = 'attachment/pic/' . $filePath;
				else $imageUrl = 'image/default_pic.jpg';
			}
			break;
        case 3://徽章图片,为jpg格式
            $filePath = getAvatarImageDir($id, '', 'gif');
			if(file_exists($config['badgeDir'] . $filePath)) $imageUrl = 'attachment/badge/' . $filePath;
			else $imageUrl = 'image/default_badge.jpg';
			break;
		case 4://道具图片，为jpg格式
			if(file_exists($config['shopGoodDir'] . $filePath)) $imageUrl = 'image/shop/good/' . $filePath;
			else $imageUrl = 'image/default_good.jpg';
			break;
		case 5://商店图片，为jpg格式
			if(file_exists($config['shopIconDir'] . $filePath)) $imageUrl = 'image/shop/icon/' . $filePath;
			else $imageUrl = 'image/default_good.jpg';
			break;
		case 6://商店店主图片，为jpg格式
			if(file_exists($config['shopHostDir'] . $filePath)) $imageUrl = 'image/shop/host/' . $filePath;
			else $imageUrl = 'image/default_good.jpg';
			break;
		case 7://小游戏大图片
			if(file_exists($config['gameDir'] . '/big/' . $filePath)) $imageUrl = 'image/mg/big/' . $filePath;
			else $imageUrl = 'image/u7.jpg';
			break;
		case 8://小游戏小图片
			if(file_exists($config['gameDir'] . '/small/' . $filePath)) $imageUrl = 'image/mg/small/' . $filePath;
			else $imageUrl = 'image/u7.jpg';
			break;
		default:
			break;
	}

	return $imageUrl;
}


/**
 * 字符串解密加密
 * 
 * @param mixed $string 
 * @param string $operation 
 * @param string $key 
 * @param int $expiry 
 * @access public
 * @return void
 */
function authCode($string, $operation = 'DECODE', $key = '', $expiry = 0)
{
	global $config;
	$ckey_length = 4;	// 随机密钥长度 取值 0-32;
				// 加入随机密钥，可以令密文无任何规律，即便是原文和密钥完全相同，加密结果也会每次不同，增大破解难度。
				// 取值越大，密文变动规律越大，密文变化 = 16 的 $ckey_length 次方
				// 当此值为 0 时，则不产生随机密钥

	$key = md5($key ? $key : $config['pplKey']);
	$keya = md5(substr($key, 0, 16));
	$keyb = md5(substr($key, 16, 16));
	$keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length): substr(md5(microtime()), -$ckey_length)) : '';

	$cryptkey = $keya.md5($keya.$keyc);
	$key_length = strlen($cryptkey);

	$string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$string;
	$string_length = strlen($string);

	$result = '';
	$box = range(0, 255);

	$rndkey = array();
	for($i = 0; $i <= 255; $i++)
	{
		$rndkey[$i] = ord($cryptkey[$i % $key_length]);
	}

	for($j = $i = 0; $i < 256; $i++)
	{
		$j = ($j + $box[$i] + $rndkey[$i]) % 256;
		$tmp = $box[$i];
		$box[$i] = $box[$j];
		$box[$j] = $tmp;
	}

	for($a = $j = $i = 0; $i < $string_length; $i++)
	{
		$a = ($a + 1) % 256;
		$j = ($j + $box[$a]) % 256;
		$tmp = $box[$a];
		$box[$a] = $box[$j];
		$box[$j] = $tmp;
		$result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
	}

	if($operation == 'DECODE')
	{
		if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16))
			return substr($result, 26);
		else
			return '';
	}
	else
		return $keyc.str_replace('=', '', base64_encode($result));
}

/**
 * 过滤字符串 
 * 
 * @param mixed $string 
 * @param mixed $length 
 * @param int $in_slashes 
 * @param int $out_slashes 
 * @param int $html 
 * @access public
 * @return void
 */
function getStr($string, $length, $inSlashes = 0, $outSlashes = 0, $html = 0) 
{
	global $_SGLOBAL;
	$string = trim($string);
	if($inSlashes)
		//传入的字符有slashes
		$string = sstripslashes($string);

	if($html < 0)
	{
		//去掉html标签
		$string = preg_replace("/(\<[^\<]*\>|\r|\n|\s|\[.+?\])/is", ' ', $string);
		$string = shtmlspecialchars($string);
	}
	elseif($html == 0)
		//转换html标签
		$string = shtmlspecialchars($string);

	if($length && strlen($string) > $length)
	{
		//截断字符
		$wordsCut = '';
		//utf8编码
		$n = 0;
		$tn = 0;
		$noc = 0;
		while ($n < strlen($string))
		{
			$t = ord($string[$n]);
			if($t == 9 || $t == 10 || (32 <= $t && $t <= 126))
			{
				$tn = 1;
				$n++;
				$noc++;
			}
			elseif(194 <= $t && $t <= 223)
			{
				$tn = 2;
				$n += 2;
				$noc += 2;
			}
			elseif(224 <= $t && $t < 239)
			{
				$tn = 3;
				$n += 3;
				$noc += 2;
			}
			elseif(240 <= $t && $t <= 247)
			{
				$tn = 4;
				$n += 4;
				$noc += 2;
			}
			elseif(248 <= $t && $t <= 251)
			{
				$tn = 5;
				$n += 5;
				$noc += 2;
			}
			elseif($t == 252 || $t == 253)
			{
				$tn = 6;
				$n += 6;
				$noc += 2;
			}
			else
				$n++;

			if($noc >= $length)
				break;
		}

		if($noc > $length)
			$n -= $tn;

		$wordsCut = substr($string, 0, $n);
		$string = $wordsCut;
	}

	if($outSlashes)
		$string = saddslashes($string);

	return trim($string);
}
/**
 * 取得客户端的ip 
 * 
 * @access public
 * @return void
 */
function getClientIp()
{
	if(isset($_SERVER['HTTP_X_FORWARDED_FOR']) && $_SERVER['HTTP_X_FORWARDED_FOR'])
		$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
	else
	{
		if(isset($_SERVER['HTTP_CLIENT_IP']) && $_SERVER['HTTP_CLIENT_IP'])
			$ip = $_SERVER['HTTP_CLIENT_IP'];
		else
			$ip = $_SERVER['REMOTE_ADDR'];
	}

	return $ip;
}

/**
 * 获取ip对应地区 
 * 
 * @param mixed $ip 
 * @access public
 * @return void
 */
function getIpLocation($ip)
{
	global $_SGLOBAL, $config;
	require_once $config['ipSourceClassUrl'];
	//返回格式
	$format = "text";//默认text,json,xml,js
	//返回编码
	$charset = "utf8"; //默认utf-8,gbk或gb2312
	#实例化(必须)
	$ip_l = new ipLocation($config['ipSourceDatUrl']);
	$address = $ip_l->getaddress($ip);

	$address["area1"] = iconv('GB2312', 'utf-8', $address["area1"]);
	$address["area2"] = iconv('GB2312', 'utf-8', $address["area2"]);
	$add = $address["area1"] . " " . $address["area2"];
	return $add;
}

/**
 * 用户头像
 * 
 * @param mixed $uId 
 * @access public
 * @return void
 */
function getUserPic($uId)
{
	global $config;
	$picFile = getAvatarImageDir($uId,'','png');
	if(file_exists($config['pictureDir'] . $picFile)) return 'attachment/pic/' . $picFile;
	return 'image/default_pic.gif';
}

/**
 * 获取avatar图片
 * 
 * @param mixed $avatar 
 * @param int $sex 
 * @access public
 * @return void
 */
function getUserAvatar($avatar, $sex = 1)
{
	global $config;
	$imgUrl = getAvatarImageDir($avatar,'','png');
	if(file_exists($config['avatarDir'] . $imgUrl)) return 'attachment/avatar/' . $imgUrl;
	return $sex == 1 ? 'image/default_boy_avatar.png' : 'image/default_gril_avatar.png';
}

/**
 * 根据年月推算天数
 * 
 * @param mixed $year 
 * @param mixed $month 
 * @access public
 * @return void
 */
function getDay($year, $month)
{
	$day = 31;
	if($month == 2)
	{
		if($year % 400 == 0 || $year % 4 == 0 && $year % 100 != 0)  $day = 29;
		else $day = 28;
	}
	elseif($month < 8)
		$day = ($month % 2 == 1) ? 31 : 30;
	else 
		$day = ($month % 2 == 1) ? 30 : 31;
	return $day;
}

/**
 * 跳转 
 * 
 * @param string $url 
 * @access public
 * @return void
 */
function redirect($url)
{
	header("HTTP/1.1 301 Moved Permanently");
	header("Location: $url");
	exit;
}
/**
 * 处理积分星星
 * 
 * @param mixed $experience 
 * @access public
 * @return void
 */
function getStar($experience) 
{
	global $config;

	$starimg = '';
	if($config['starCredit'] > 1) 
	{
		//计算星星数
		$starnum = intval($experience/$config['starCredit']) + 1;
		if($config['starLevelNum'] < 2) 
		{
			if($starnum > 10) $starnum = 10;
			for($i = 0; $i < $starnum; $i++) 
			{
				$starimg .= '<img src="image/star_level10.gif" align="absmiddle" />';
			}
		} 
		else 
		{
			//计算等级(10个)
			for($i = 10; $i > 0; $i--) 
			{
				$numlevel = intval($starnum / pow($config['starLevelNum'], ($i - 1)));
				if($numlevel > 10) $numlevel = 10;
				if($numlevel) 
				{
					for($j = 0; $j < $numlevel; $j++) 
					{
						$starimg .= '<img src="image/star_level'.$i.'.gif" align="absmiddle" />';
					}
					break;
				}
			}
		}
	}
	if(empty($starimg)) $starimg = '<img src="image/credit.gif" alt="'.$experience.'" align="absmiddle" alt="'.$experience.'" title="'.$experience.'" />';
	return $starimg;
}

/**
 * 数组排序
 * 
 * @param mixed $arrayData 
 * @param mixed $keyName1 
 * @param string $sortOrder1 
 * @param string $sortType1 
 * @access public
 * @return void
 */
function sysSortArray($arrayData, $keyName1, $sortOrder1 = 'SORT_ASC', $sortType1 = 'SORT_REGULAR')
{
	if(!is_array($arrayData)) return $arrayData;
	$argCount = func_num_args();
	for($i = 1;$i < $argCount;$i++)
	{
		$arg = func_get_arg($i);
		if(!@ereg("SORT",$arg))
		{
			$keyNameList[] = $arg;
			$sortRule[] = '$' . $arg;
		}
		else
		{
			$sortRule[] = $arg;
		}
	}
	foreach($arrayData as $key => $info)
	{
		foreach($keyNameList as $keyName)
		{
			${$keyName}[$key] = $info[$keyName];
		}
	}
	$evalString = 'array_multisort(' . join(",",$sortRule) . ',$arrayData);';
	eval($evalString);
	return $arrayData;
}

function getUserBasePic($uId)
{
	global $config;
	if($uId == 100001) $imageUrl = '../image/zyj.jpg';
	elseif($uId == 100002) $imageUrl = '../image/zyq.jpg';
	else
	{
		if(file_exists($config['cdn'] . getAvatarImageDir($uId, '', 'jpg')))
		{
			$imageUrl = $config['cdn'] . getAvatarImageDir($uId, '', 'jpg');
		}
		else
			$imageUrl = $config['cdn'] . 'default_pic.jpg';
	}

	return $imageUrl;
}

/**
 * 将链接地址放入到cdn队列中等待更新 
 * 
 * @param mixed $cdnPicUrl 
 * @access public
 * @return void
 */
function refreshIntoCdn($cdnPicUrl)
{
	global $_SGLOBAL, $config, $cache;
	$cdnKey = 'refresh:cdn:key';

	require_once $config['libs'] . './dal/Dal.php';
	$dal = new Dal();
	$permCache = $dal->initCache($cache['permCache'], $cache['permCacheType']);
	return $permCache->rpush($cdnKey, $cdnPicUrl);
}

/**
 * 后台管理员操作日志记录 
 * 
 * @param mixed $str 
 * @access public
 * @return void
 */
function adminUserLog($str)
{
	global $config;
	$auser = isset($_SESSION['auser'])?$_SESSION['auser']:"game_api";
	$v = date('Y-m-d H:i:s') . ' ' . '管理员:' . $auser . ' ' . $str . "\n";
	$fp = fopen($config['adminuserlog'] . date('Y-m-d') . '.txt', 'a+');
	fwrite($fp, $v);
	fclose($fp);
}

/**
 * 后台管理员操作日志记录 
 */
function userLogMdb($str,$type=1) {
	global $dbmongo;
	//1查看2编辑3删除4添加5申请
	$ins = array();
	$tpd = $dbmongo['operate_log']['mongo'];
	$ins['u'] = isset($_SESSION['auser'])?(string)$_SESSION['auser']:"empty";
	$ins['c'] = (string)$str;
	$ins['t'] = (string)time();
	$ins['type'] = (string)$type;
	@$mongoObj = new MongodbApi($tpd['host'],$tpd['user'],$tpd['pass'],$tpd['port'],$tpd['dbname']);
	@$mongoObj->insert($tpd['dbname'], 'operate_log', $ins);
}

/**
 * 后端程序执行log
 */
function adminUserGmLog($str)
{
	global $config;
	$v = date('Y-m-d H:i:s') . '|' . $str . "\n";
	$fp = fopen($config['adminusergmlog'] . date('Y-m-d') . '.txt', 'a+');
	fwrite($fp, $v);
	fclose($fp);
}

/**
 * 生成统计报表曲线 
 * 
 * @param mixed $tip 
 * @param mixed $colour 
 * @param mixed $size 
 * @param mixed $data 
 * @param mixed $title 
 * @access public
 * @return void
 */
function setOfcLine($tip, $colour, $data, $title, $size)
{
		include_once 'image/ofc/php-ofc-library/open-flash-chart.php';

		$hol = new hollow_dot();
		$hol->size(4)->halo_size(1)->tooltip($tip);
		$line_default_dot = new dot();
		$line_default_dot->colour($colour);
		$line = new line();
		$line->set_default_dot_style($hol);
		$line->set_values($data);
		$line->set_colour($colour);
		$line->set_key($title,$size);
		return $line;
}

/**
 * 验证邮箱
 * 
 * @param mixed $var 
 * @param int $type 
 * @access public
 * @return void
 */
function checkMail($var, $type = 1)
{
	$par = confirmType($type);
	if(!isset($par[$var]))
		return false;

	$email = trim($par[$var]);
	if(!$email || !preg_match("/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/", $email))
		return false;

	return $email;
}

/**
 * 从数组生成插入表的字段字符串
 *  
 * @param array $arrFeilds
 * @access public
 * @return string 结果串
 */
function makeFieldStringFromArray(array $arrFeilds = array())
{
    return '`'.implode('`,`',$arrFeilds).'`';        
}

/**
 * 从数组生成插入表的字段数据
 *
 * @param array $arrValues
 * @access public
 * @return string 结果串
*/
function makeValueStringFromArray(array $arrValues = array())
{
    return "'".implode("','",$arrValues)."'";
}

/**
 * 得到页数
 *
 * @param int $page
 * @access public
 * @return int 结果页码
 */
function getPageNumber($page)
{
    $page   = intval($page);
    if( 0 >= $page ) {
        return 0;
    }

    return $page - 1; 
}

/**
 * 检测记录ID的合法性
 *
 * 要是正确则返回正确值，错误返回-1
 * @param int $id
 * @access public
 * @return mix 是否合法 或 正确值
 */
function checkRecordId($id)
{
    if(isset($id) && preg_match('/^\d+$/',$id) > 0) {
       return $id; 
    }

    return false; 
}

/**
 * 去掉字符串两边的空格后，看元素是否还为真
 * 数字0也是为真
 *
 * @param String $element 
 * @access public
 * @return boolean 是否还为真
 */
function checkString($element = '')
{
    $element    = trim($element);
    if(is_numeric($element) || !empty($element)) {
        return true;
    }

    return false;
}

/**
 * 将数组里的下标跟下标对应的值连成一个字符串
 * 每个元素之前用给写的中间字符间隔
 *
 * @param array $arrData 处理数组数据
 * @param String $midString 中间字符
 * @access public
 * @return String 结果 
 */
function joinArrayKeyAndValue($arrData, $midString = '') 
{
    if( empty( $arrData ) ) return null;
    $resultString   = '';
    foreach($arrData as $key => $value) {
       $resultString    .= ' (' . $key.$value . ') ' . $midString; 
    }
    
    return $resultString; 
}

/**
 * 检测值是否为空值，除数字0以外
 *
 * @param mix $value 检测的值
 * @access public
 * @return boolean 是否是
 */
function checkEmptyButZero($value = null) {
    $value  = trim( $value );
    if( $value != '' &&  ($value == 0 || !empty( $value )) ) {
        return false;
    }

    return true;
}

/**
 * 过滤请求的字符串
 *
 * @param mix $filterData 需要过滤的数据,可以是多维数组
 * @access public
 * @return mix 结果数据 
 */
function encodeRequestData($filterData = '') {
    static $arrReplace   = array("'" => "\'");
    if( is_array( $filterData ) ) {
        foreach( $filterData as $key => $value ) {
            if ( is_array( $value ) ) {
                $value   = encodeRequestData( $value );
            }else {
                $value   = htmlspecialchars( $value );
                $filterData[$key]   = strtr($value,$arrReplace);
            }
        }
    
        return $filterData;
    } else {
        $filterData     = htmlspecialchars( $filterData );

        return strtr( $filterData,$arrReplace );
    } 
}

/**
 * 验证字符串长度是否在指定范围内
 *
 * @param string $str 检测字串
 * @param int $minLen 最小长度
 * @param int $maxLen 最大长度
 * @access public
 * @return boolean 是否合法
 */
function validateString($str,$minLen, $maxLen) {
    $len    = mb_strlen( $str, 'utf-8' );
    if( $len >= $minLen && $len <= $maxLen ) {
        return true;
    }

    return false;
}

/**
 * 验证数值是否在指定的值范围内
 *
 * @param int $number 要测试的数值
 * @param int $minValue 最小值
 * @param int $maxValue 最大值
 * @access public
 * @return boolean 是否有效 
 */
function validateNumber($number, $minValue, $maxValue) {
    if ( is_numeric( $number ) ) {
        if( $number >= $minValue && $number <= $maxValue ) {
            return true;
        }
    }

    return false;
}

/**
 * 清除值为空的数组元素，数字0不是空值
 *
 * @param array $filterData 需要过虑的数组
 * @access public
 * @return array 
 */
function filterEmptyElementButZero($filterData = array()) {
    if( is_array( $filterData ) ) {
        foreach( $filterData as $key => $value ) {
            if( is_array ( $value ) ) {
                $filterData[$key]   = filterEmptyElementButZero( $value );
            } else {
                if( checkEmptyButZero( $value ) ) {
                    unset( $filterData[$key] );
                }
            }
        } 
        return $filterData; 
    }

    return $filterData;
}

/**
 * 更新登录资源LoginSource.js 
 * 
 * @access public
 * @return void
 */
function sendLoginImJs()
{
	global $_SGLOBAL, $config;
	require_once 'UserInfo.php';
	require_once 'User.php';
	$userinfo = new Userinfo;
	$user = new User;
	$LogIm = $userinfo->getLoginImInfo();
	$LogSource = $userinfo->getLoginSourceInfo();
	$i = $text = $ii = array();
	foreach($LogIm as $k=>$v)
	{
		if(!in_array($v['ub_id'], $i))
		{
			$imsg = $userinfo->getLoginImListByUid($v['ub_id']);
			foreach($imsg as $ke=>$va)
			{
				$text1 = strtr($va['pl_text'], array("\""=>"'"));
				$text[] = $text1;
			}
			$ii[] = array("id" => intval($v['ls_type']), "msg" => $text);
			$i[] = $v['ub_id'];
			$ss = '';
			$text1 = '';
			$text2 = '';
			$text = array();
		}
	}
	foreach($i as $ik=>$iv)
	{
		if(in_array($iv, array(100001, 100002, 100005, 100006, 8)))
		{
			unset($i[$ik]);
		}
    }
    $rt = array_slice($i, -3, 1);
	$ry = array_slice($i, -2, 1);
	$ra = array_slice($i, -1, 1);
	$o = '';
	$rce = $userinfo->getLoginSourceInfo();
	foreach($rce as $k => $v)
	{
		$rce[$k]['id'] = $v['ls_type'];
		if($v['ls_type'] == 5)
            $rce[$k]['src'] = $v['ls_src'];// . $ry[0];
        elseif($v['ls_type'] == 3)
			$rce[$k]['src'] = $v['ls_src'];// . $rt[0];
		elseif($v['ls_type'] == 6)
			$rce[$k]['src'] = $v['ls_src'];// . $ra[0];
		else
			$rce[$k]['src'] = $v['ls_src'];
		$rce[$k]['link'] = $v['ls_link'];
		unset($rce[$k]['ls_id']);
		unset($rce[$k]['ls_type']);
		unset($rce[$k]['ls_src']);
		unset($rce[$k]['ls_link']);
	}
	$sc = json_encode(array("resouce" => $rce, "msg" => $ii));
	$sc = strtr($sc, array("'" => '\\\''));
	$source = 'var loginSource = ' . '\'' .    $sc   . '\'' . '; function getLoginSource(){return loginSource;}';
	//写入LoginSource.js文件
	$dir = $config['attaReUrl'] . 'LoginSource.js';
	$gfile = fopen($dir, "w");
	fwrite($gfile, $source);
	fclose($gfile);
}

/**
 * 验证是合法的超链接地址
 *
 * @param string $url 检测的地址
 * @access public
 * @return boolean
 */
function isUrl($url) {
    $mode       = '~(ftp|http|https)://([0-9a-zA-Z?&=%./\-_#:]+)~i';
    if(preg_match($mode, $url)) {
        return true;
    }

    return false;
}
 
/**
 * 判断是否登录
 *
 */
function isLogin(){
	if(isset($_SESSION['auser']) && $_SESSION['auser'] && isset($_SESSION['aprs']) && $_SESSION['aprs'])
	{
		template('index.tpl');exit;
	}else{
		$msg = "请登录";
		$assign1 = array('msg'=>$msg);
		template('admingm/login.tpl',array('display',$assign1));exit;
	}
}

/**
 * 得到skip
 */
function getSkip($perpage){
	$page = isset($_GET['p']) ? intval($_GET['p']) : 1;
	$page = $page < 1 ? 1 : $page;
	$skip = ($page-1)*$perpage;
	if($skip<0) $skip = 0;
	return $skip;
}

function getPage($perpage){
	global $assign;
	$page = isset($_GET['p']) ? intval(trim($_GET['p'])) : 1;
	$page = $page < 1 ? 1 : $page;
	$assign['page_pg'] = $page;
	$offset = ($page - 1) * $perpage;
	return $offset;
}

/**
 * js时间戳转换成date时间
 */
function getDateTimeByTime($stime){
	$stime = (int)((int)$stime/1000);
	$datetime = date("Y-m-d H:i:s",$stime);
	return $datetime;
}

/**
 * 连接mongo测试
 */
function connectMongoTest($mongoarr){
	global $config;
	$host = !empty($mongoarr['host'])?$mongoarr['host']:'';
	$user = !empty($mongoarr['user'])?$mongoarr['user']:'';
	$pass = !empty($mongoarr['pass'])?$mongoarr['pass']:'';
	$port = !empty($mongoarr['port'])?$mongoarr['port']:'';
	$dbname = !empty($mongoarr['dbname'])?$mongoarr['dbname']:'';
	if(!$host){return false;}
	$tempCon = new MongodbApi($host,$user,$pass,$port,$dbname);
	if(isset($tempCon->bool) && $tempCon->bool){
		unset($tempCon);
		return true;
	}else{
		return false;
	}
}

/**
 * 得到颜色值
 */
function getUseColors(){
	$colors = array("#000000","#FFFFFF","#BFBFBF","#6699FF","#99CC33","#FFCC00","#808080","#3366CC","#00CC00","#FF9900","#404040","#003399","#FF6600","#FF6600","#CC0000","FFE400");
	return $colors;
}

function mk_dir($dir, $mode = 0755)
{
	if (is_dir($dir) || @mkdir($dir,$mode)) return true;
	if (!mk_dir(dirname($dir),$mode)) return false;
	return @mkdir($dir,$mode);
} 

function array2_sort($arr,$keys,$type='asc'){ 
	$keysvalue = $new_array = array();
	foreach ($arr as $k=>$v){
		$keysvalue[$k] = $v[$keys];
	}
	if($type == 'asc'){
		asort($keysvalue);
	}else{
		arsort($keysvalue);
	}
	reset($keysvalue);
	foreach ($keysvalue as $k=>$v){
		$new_array[$k] = $arr[$k];
	}
	return $new_array; 
} 
function url_encode($str) {  
    if(is_array($str)) {  
        foreach($str as $key=>$value) {  
            $str[urlencode($key)] = url_encode($value);  
        }  
    } else {  
        $str = urlencode($str);  
    }  
      
    return $str;  
} 
function arrayKeyChange($arr,$str) {  
	$tempArr = array();
	foreach($arr as $k=>$v){
		$tempArr[$v[$str]] = $v;
	}
    return $tempArr;  
} 
function insertDbTable($addinfo){
	$f_arr = array();
	$v_arr = array();
	foreach( $addinfo as $key=>$value){
		$f_arr[] = "`".$key."`";	
		$v_arr[] = "'".$value."'";	
	}
	$f_str = implode(',',$f_arr);
	$v_str = implode(',',$v_arr);
	return array('key'=>$f_str,'val'=>$v_str);
}
function updateDbTable($editinfo){
	$arr = array();
	foreach($editinfo as $key=>$value){
		$arr[]  = "`".$key."`='".$value."'";
	}
	$result = implode(',',$arr);
	return $result;
}
/**
 * 验证用户是否选择区服
 */
function getCurGmSv() {
	if(isset($_SESSION['CurGameSv']) && $_SESSION['CurGameSv']) {
		return $_SESSION['CurGameSv'];
	}else
		showMessage('还没有选择区服，请选择需要查询的区服');
}
//临时设置当前服务
function setCurGmSv($curgmsv) {
	ssession('CurGameSv',$curgmsv);
}

function channelSel(){
		global $CURSV,$CM;
		$chnid= isset($_REQUEST['chnid']) ? (int)saddslashes(trim($_REQUEST['chnid'])):(int)$CURSV['curchnel']['id'];
		//得到当前渠道
		if(empty($chnid)){ showMessage('请先选择渠道！', 'admingm.php?ac=gamelist'); }
		$chnInfo = $CM->getChnById($chnid);
		if(empty($chnInfo)){ showMessage('请先选择渠道！', 'admingm.php?ac=gamelist'); }
		return $chnInfo;
}
function objarray_to_array($obj) {  
    $ret = array();  
    foreach ($obj as $key => $value) {  
	    if (gettype($value) == "array" || gettype($value) == "object"){  
            $ret[$key] =  objarray_to_array($value);  
	    }else{  
	        $ret[$key] = $value;  
	    }  
    }  
    return $ret;  
} 
function itemChange($jsonItem,$typeItem,$type=1) {  
    $ret = "";
	$arrItem = json_decode($jsonItem,true);
	if(empty($arrItem)){
		return "";	
	}else{
		foreach($arrItem as $k=>$v){
			if($type==1){
				$ret .= $typeItem[$v['type']][$v['id']]."*".$v['num']."&nbsp;&nbsp;";
			}elseif($type==2){
				if(!empty($typeItem[$v['t']][$v['id']])) $ret .= $typeItem[$v['t']][$v['id']]."*".$v['n']."&nbsp;&nbsp;";
				else{
					$ret .= $v['t']."|".$v['id']."*".$v['n']."&nbsp;&nbsp;";	
				}
			}
		}
	}
    return $ret;  
} 
function mMonSelect(){
	global $config,$assign;
	require_once $config['modules'].'/Common.php';
	require_once $config['modules'].'/LMon.php';
	$CM = new Common;
	$chnid= isset($_REQUEST['chnid']) ? (int)saddslashes(trim($_REQUEST['chnid'])):"";
	$serid= isset($_REQUEST['serid']) ? saddslashes(trim($_REQUEST['serid'])):"";
	$assign['chnid'] = $chnid;
	$assign['serid'] = $serid;
	$chnInfo = $CM->getChnById($chnid);
	if(empty($chnInfo)){ showMessage('该渠道不存在，请确认！'); }
	$chnconfig = (array)json_decode($chnInfo['dbsetting']);
	$LM = new LMon($chnconfig);
	$serInfo = $LM->getOneServer($serid);
	if(empty($serInfo)){ showMessage('该服务器不存在，请确认！'); }
	$assign['cursername'] = $serInfo['name'];
	$gmDbInfo = (array)json_decode($serInfo['config']);
	return $gmDbInfo;
}
function mysqlIn($cids,$field="id"){
	$cids_arr = explode(',',$cids);
	$delids = array();
	foreach($cids_arr as $cv){
		if(!empty($cv)){
			$delids[]= (int)$cv;
		}
	}
	if(empty($delids)) showMessage('参数不正确！');
	$delids = implode(',',$delids);
	$where = $field." in(".$delids.")";
	return $where;
}
