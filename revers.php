<?php
/*
 * На одном из яп (предпочтительно на одном из PHP / Ruby / JS) написать функцию
 *  которая переворачивает строку.
 *
 *  На вход принимает любую строку до 255 символов
 *  На выходе возвращает перевернутую строку
 *
 *  Пример: функция revert('asdfghj') вернет 'jhgfdsa'
 *
 *  PS: нужно реализовать именно алгоритм (не нужно пользоваться встроенной функций
 *  языка по переворачиваю строки)
 * 
 */

/**
 * функция переворота строки
 * @param string $string
 * @return string
 */
function reverseString($string) {
    $lenString = mb_strlen($string, 'UTF-8');
    $arrayTo = [];
    if ($lenString > 255) {
        return 'Заднаная строка превышает длинну в 255 символов';
    }

    for ($i = $lenString; $i >= 0; $i--) {
        $arrayTo[] = mb_substr($string, $i, 1, 'UTF-8');
    }

    return implode('', $arrayTo);
}

echo reverseString('Андрей любит кушать пирожки');
