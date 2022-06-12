<?php
    function getItAndAllSubCateIDs($cateList, $cate_id) {
        $allSubCateIDs = array($cate_id);
        foreach ($cateList as $key => $cate) {
            if ($cate['parent_cate_id'] == $cate_id) {
                unset($cateList[$key]);
                $sub = getItAndAllSubCateIDs($cateList, $cate['cate_id']);
                if ($sub) {
                    $allSubCateIDs = array_merge($allSubCateIDs, $sub);
                }
            }
        }
        return $allSubCateIDs;
    }
?>
