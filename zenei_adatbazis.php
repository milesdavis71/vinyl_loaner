<?php
//Küldés
// a connect php-hez csatlakozási lehetőségek:
// include, include_omce. require, require_once
// 1. adatbázishoz való csatlakozáshoz az utolsó a jó, mert szükséges, de csak egyszer.
// A -> jelentése: objetkum operátor, az adatbázis objektum területén az adatbázis eléréséhez a query metódust
// használja. 2 táblából kell adatokat kiolvasni, először a „foldreszek”-ból, aztán (később) az „orszagok”-ból.
require_once('config/init.php');
$sql = "SELECT * FROM performer";
$result = $con -> query($sql);

printHTML('html/header.html');

echo printMenu();

?>
<!--Szörcs css-->
<style type="text/css">
    body{
        font-family: Arail, sans-serif;
    }
    /* Formatting search box */
    .search-box{
        position: relative;
        display: inline-block;
        font-size: 14px;
    }
    .search-box input[type="text"]{
        height: 32px;
        padding: 5px 10px;
        border: 1px solid #CCCCCC;
        font-size: 14px;
    }
    .result{
        position: absolute;
        z-index: 999;
        top: 100%;
        left: 0;
    }
    .search-box input[type="text"], .result{
        width: 100%;
        box-sizing: border-box;
    }
    /* Formatting result items */
    .result p{
        margin: 0;
        padding: 7px 10px;
        border: 1px solid #CCCCCC;
        border-top: none;
        cursor: pointer;
    }
    .result p:hover{
        background: #f2f2f2;
    }
</style>
<!--Szörcs css vége-->

<!--Szörcs script-->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('.search-box input[type="text"]').on("keyup input", function(){
            /* Get input value on change */
            var inputVal = $(this).val();
            var resultDropdown = $(this).siblings(".result");
            if(inputVal.length){
                $.get("backend-search.php", {term: inputVal}).done(function(data){
                    // Display the returned data in browser
                    resultDropdown.html(data);
                });
            } else{
                resultDropdown.empty();
            }
        });

        // Set search input value on click of result item
        $(document).on("click", ".result p", function(){
            $(this).parents(".search-box").find('input[type="text"]').val($(this).text());
            $(this).parent(".result").empty();
        });
    });
</script>
<!--Szörcs script vége-->


<div class="cell medium-auto medium-cell-block-container">
    <div class="grid-x grid-padding-x">
        <div class="cell medium-3 medium-cell-block-y">

            <!--Szörcs html eleje-->
            <div class="search-box">
                <input type="text" autocomplete="off" placeholder="Search country..." />
                <div class="result"></div>
            </div>
            <!--Szörcs html vége-->

            <form>

            <select class="form-control" name="performer">
                <option value="0">Mind</option>
                <?php
                // 2. A kontinensek nevének beinjektálása a select listába
                // a while-ban a result->fetch_array() megtölt egy eredménysort (visszaad egy tömböt)
                // asszociatív (kulcs-érték pár) vagy numerikus tömbként, vagy mindkét módon.
                // fetch -> utasításkód kiolvasás
                // $row -> ez egy tömb, ami a $row = $result -> fetch_array() metódusból
                // jön. A $row „id adatbázis sorként” azonosítja a tömb értékét,
                // ezért „$row” a neve. Éppen ezért az adott „row”-ra kétféleképpen
                // lehet hivatkozni: vagy megadod a kapcsos zárójelen belül idézőjellel
                // a sor nevét, vagy megadod a sorszámát (1, 2, 3)
                // ez a while feltölti a select dropdown list-et a "continent" táblából
                // kiolvasott értékekkel.
                while ($row = $result -> fetch_array()){
//                            echo '<option value="'.$row[0].'">'.$row[1].'</option>';
                    $performer = $_GET['performer'];
                    if(!($performer == $row[0])){
                        echo '<option value="'.$row[0].'">'.$row[1].'</option>';
                    }
                    if($performer == $row[0]){
                        echo '<option value="'.$row[0].'" selected>'.$row[1].'</option>';

                    }

                }
                ?>
            </select>

            <button type="submit" class="button">Szűrés</button>
            <?php
            $sql = "SELECT * FROM album";
            $result = $con -> query($sql);
            $all= $result->num_rows;

            if (isset($_GET['performer'])) {
                $sql .= " WHERE performer_id=".$_GET['performer'];
            }

            $con ->query($sql);
            $result = $con -> query($sql);
            if (!$result){
                die("Eredménytelen a lekérdezés!");
            }
            else if($performer==0){
                echo '<p>'.$all.' album felel meg a keresésnek</p>';
            }

            else if (!($_GET['performer']==0)){
                echo '<p>'.$result->num_rows.' album felel meg a keresésnek';
            }

            ?>
            </form>



<!--     Stackowerflow       -->
            <form action="" method="post">
                <input type="radio" name="genre" value="1" checked="checked">MasterCard<br>
                <input type="radio" name="genre" value="2">Visa<br>
                <input type="radio" name="genre" value="3 Express">American Express<br>
                <input type="submit" name="button" value="Submit"/></form>
            <?php

            if(isset($_POST['genre'])){
                $name_of_radio_button= $_POST ['genre'];
            } else {
                $name_of_radio_button= "No Button Selected";
            }

            ?>

            <!--     Stackowerflow vége       -->

        </div>

        <div class="cell medium-9 medium-cell-block-y">

            <br>
            <h5 class="text-center"> Albumok szűrése műfaj alapján</h5>
            <hr>


            <div class="grid-container">
                <div class="grid-x grid-margin-x grid-margin-y">
                    <?php
                    $sql = "select * from album inner join performer on perform_id = performer_id inner join music_genre on genr_id = genre_id inner join grading on grd_id = grade_id";

                     if (isset($_POST['genre'])) {
                        $sql .= $_POST['genre'] != 0 ? " WHERE genre_id=".$_POST['genre'] : "";
                        $sql .= " OR performer_id=$name_of_radio_button";

                        $sql .= " ORDER BY performer";
                    }

                    if (isset($_GET['performer'])) {
                        $sql .= $_GET['performer'] != 0 ? " WHERE performer_id=".$_GET['performer'] : "";
                        $sql .= " ORDER BY performer";
                    }




                    $result = $con -> query($sql);

                    if (!$result){
                        die("Eredménytelen a lekérdezés!");
                    }

                    // TODO kártyák abc sorrendbe, nézd meg a galáriás projektetm, ott egy result array-be van visszahívva az echo

                    while ($row = $result -> fetch_assoc()) {
                        echo "<div class=\"cell small-12 large-3\">
                <div class=\"card card-reveal-wrapper\">
                  <img src=\"{$row['path']}{$row['filename']}\">
                  <div class=\"card-section\">
                    <i class=\"fa fa-angle-up open-button\"><span class=\"show-for-sr\">More</span></i>
                        <p class='text-center'>{$row['performer']}<br>
                        {$row['title_of_record']}</p>
                    <div class=\"card-reveal\">
                      <span class=\"card-reveal-title\">
                       
                        <i class=\"fa fa-angle-down close-button\"><span class=\"show-for-sr\">Close</span></i>
                        ";
                        if($row['avbl']){
                            echo '<p>A hanglemez kikölcsönözhető.</p>';
                        } else{
                            echo '<p>A hanglemezt kikölcsönözték.</p>';
                        }
                        echo "    <p>A lemez kiadásának éve: {$row['release_date']}</p>
                      <p>Az album műfaja: {$row['genre']}</p>
                      <p>Lemezminőség: {$row['grade_hu']}</p>

                      
                    </span>
                    </div> <!-- /.card-reveal -->
                  </div> <!-- /.card-section -->
                </div> <!-- /.card -->
                </div>";

                    }
                    ?>
                </div>
            </div>
        </div>

        <?php
        printHTML('html/footer.html');
        $con -> close();
        ?>
