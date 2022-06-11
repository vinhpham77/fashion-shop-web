<?php
    function getSubCates($cates, $id) {
        $cateTree = array();
        foreach ($cates as $key => $sub_cate) {
            if ($sub_cate['parent_cate_id'] == $id) {
                $sub = getSubCates($cates, $sub_cate['cate_id']);
                if ($sub) {
                    $sub_cate['children'] = $sub;
                }
                $cateTree[] = $sub_cate;
                unset($cates[$key]);
            }
        }
        return $cateTree;
    }

    function showCategory($cateTree, $level) {
        foreach ($cateTree as $cate) {
            $cate_id = $cate['cate_id'];
            $cate_name = $cate['cate_name'];
            echo "<li><a href='category.php?cate_id=$cate_id'>$cate_name</a>";
            if (!empty($cate['children'])) {
                if ($cate['parent_cate_id'] == 0) {
                    echo "<ul class='sub-menu'>";
                } else {
                    echo "<ul>";
                }
                showCategory($cate['children'], ++$level);
                echo "</ul>
                </li>";
            } else {
              echo "</li>";
            }
        }
    }
?>
