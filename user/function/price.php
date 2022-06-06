<?php
    function getPrice($prod_price, $promo_price, $calc_unit) {
        if ($promo_price !== null) {
            if ($calc_unit == 1) {
                $discount = $prod_price * $promo_price / 100;
            } else {
                $discount = $promo_price;
            }
            return $prod_price - $discount;
        } else {
            return $prod_price;
        }
    }

    function formatNumber($number) {
        return number_format($number, 0, '', '.');
    }

    function convertToNumber($string) {
        $pattern = array ('/\./', '/đ/', '/<sup>đ<\\sup>/');
        return preg_replace($pattern, '', $string);
    }

    function getCalcUnit($string) {
        switch ($string) {
            case 1:
                $calc_unit = '%';
                break;
            case 0:
                $calc_unit = 'đ';
                break;
            default:
                $calc_unit = '';
        }
        return $calc_unit;
    }
?>
