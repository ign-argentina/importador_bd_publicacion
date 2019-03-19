<?php
/****************************************************
Folder administration

****************************************************/

function createDir($directory) {
	if(!is_dir($directory)){
	    if(!mkdir($directory, 0777, true)) {
	        die('Fallo al crear el directorio...');
	    }
	}
}