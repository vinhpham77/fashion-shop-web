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
?>
