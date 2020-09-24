<?session_start();
@ob_start();

include "../include/header_admin.php";
?>
<!-- //end header -->

    
<header>
    <h1>ADMIN</h1>
    <div class="location">
        <span>홈</span>
        <span>카테고리</span>
    </div>
</header>

<section class="section_admin">
    <nav>
        <ul>
            <li><a href="./write_buy.php">상호</a></li>
            <li><a href="./category.php" class="active">카테고리</a></li>
            <li><a href="../page/list_sell.php" target="_blank">팝니다 제품</a></li>
            <li><a href="../page/list_buy.php" target="_blank">삽니다 제품</a></li>
            <li><a href="./member_list.php">회원</a></li>
            <li><a href="./banner_list.php">배너</a></li>
            <li><a href="./setting_user.php">접속자설정</a></li>
            <li><a href="./setting_goods.php">메인상품설정</a></li>
            <li><a href="./qna_list.php">Q&A</a></li>
        </ul>
    </nav>

    <div class="content_admin">
        <h2>카테고리</h2>
        <div class="category">
            <div class="left">
                <h3>카테고리 확인</h3>
                <ul>
                    <li>
                        <a class="btn_depth1" href="javascript:;">대분류1</a>
                        <ul>
                            <li><a class="btn_depth2" href="javascript:;">중분류1</a></li>
                            <li><a class="btn_depth2" href="javascript:;">중분류2</a></li>
                            <li><a class="btn_depth2" href="javascript:;">중분류3</a></li>
                            <li><a class="btn_depth2" href="javascript:;">중분류4</a></li>
                            <li><a class="btn_depth2" href="javascript:;">중분류5</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="btn_depth1" href="javascript:;">대분류2</a>
                        <ul>
                            <li><a class="btn_depth2" href="javascript:;">중분류1</a></li>
                            <li><a class="btn_depth2" href="javascript:;">중분류2</a></li>
                            <li><a class="btn_depth2" href="javascript:;">중분류3</a></li>
                            <li><a class="btn_depth2" href="javascript:;">중분류4</a></li>
                            <li><a class="btn_depth2" href="javascript:;">중분류5</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="btn_depth1" href="javascript:;">대분류3</a>
                        <ul>
                            <li><a class="btn_depth2" href="javascript:;">중분류1</a></li>
                            <li><a class="btn_depth2" href="javascript:;">중분류2</a></li>
                            <li><a class="btn_depth2" href="javascript:;">중분류3</a></li>
                            <li><a class="btn_depth2" href="javascript:;">중분류4</a></li>
                            <li><a class="btn_depth2" href="javascript:;">중분류5</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="right">
                <h3>카테고리 추가</h3>
                <div class="categoryAdd">
                    <h4>대분류 선택</h4>
                    <div class="depth01">
                        <a href="javascript:;">대분류1</a>
                        <a href="javascript:;">대분류2</a>
                        <a href="javascript:;">대분류3</a>
                        <a href="javascript:;">대분류4</a>
                        <a href="javascript:;">대분류5</a>
                        <a href="javascript:;">대분류6</a>
                        <div class="addBox">
                            <a href="javascript:;">직접등록하기</a>
                            <input type="text" placeholder="카테고리명을 입력하세요">
                        </div>
                    </div>
                    <div class="txt_center mid_arr"><img src="../images/admin/arr_down.svg" alt=""></div>
                    <h4>중분류 선택</h4>
                    <div class="depth01 depth02">
                        <a href="javascript:;">중분류1</a>
                        <a href="javascript:;">중분류2</a>
                        <a href="javascript:;">중분류3</a>
                        <a href="javascript:;">중분류4</a>
                        <a href="javascript:;">중분류5</a>
                        <a href="javascript:;">중분류6</a>
                    </div>
                    <a href="javascript:;" class="btn_confirm">등록</a>
                </div>
            </div>
        </div>
    </div>

</section> <!-- //header 파일에 있음 -->

<!-- footer -->
<?include "../include/oldie.php";?>

<!-- footer -->
<?include "../include/footer_admin.php";?>