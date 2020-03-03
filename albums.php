<?php
// pushpush
// a connect php-hez csatlakozási lehetőségek:
// include, include_omce. require, require_once
// 1. adatbázishoz való csatlakozáshoz az utolsó a jó, mert szükséges, de csak egyszer.
// A -> jelentése: objetkum operátor, az adatbázis objektum területén az adatbázis eléréséhez a query metódust
// használja. 2 táblából kell adatokat kiolvasni, először a „foldreszek”-ból, aztán (később) az „orszagok”-ból.
require_once('config/init.php');
$sql = "SELECT * FROM performer";
$result = $con -> query($sql);

printHTML('html/header.html');

echo printMenuFix();

?>
<div class="grid-y medium-grid-frame">
    <div class="cell medium-auto medium-cell-block-container">
        <div class="grid-x grid-padding-x">
            <div class="cell medium-2 medium-cell-block-y">
                <br>
                <div class="callout">
                    <h6>Műfaj kiválasztása</h6>
                    <hr style="margin-top: 0rem; margin-bottom: 0.5rem;">
                    <form action="" method="GET">
                    <input type="radio" name="genre" value="1" <?php if (isset($_GET['genre']) && $_GET['genre'] == '1')  echo ' checked="checked"';?> />rock<br>
                    <input type="radio" name="genre" value="2" <?php if (isset($_GET['genre']) && $_GET['genre'] == '2')  echo ' checked="checked"';?> />jazz<br>
                    <input type="radio" name="genre" value="3" <?php if (isset($_GET['genre']) && $_GET['genre'] == '3')  echo ' checked="checked"';?> />klasszikus<br>
                    <input type="radio" name="genre" value="4" <?php if (isset($_GET['genre']) && $_GET['genre'] == '4')  echo ' checked="checked"';?> />elektronikus<br>
                    <input type="radio" name="genre" value="0" <?php if (isset($_GET['genre']) && $_GET['genre'] == '0') echo ' checked="checked"';?> />Mind<br>

                        <h6 class="small" style="margin-top: 0.7rem;">Kölcsönzés állapota</h6>
                        <hr style="margin-top: 0rem; margin-bottom: 0.5rem;">

                    <input type="radio" name="avbl" value="1" <?php if (isset($_GET['avbl']) && $_GET['avbl'] == '1')  echo ' checked="checked"';?> />Kikölcsönözhető<br>
                    <input type="radio" name="avbl" value="2" <?php if (isset($_GET['avbl']) && $_GET['avbl'] == '2')  echo ' checked="checked"';?> />Nem Kikölcsönözhető<br>
                    <input type="radio" name="avbl" value="0" <?php if (isset($_GET['avbl']) && $_GET['avbl'] == '0')  echo ' checked="checked"';?> />Mind<br>

                    <input type="submit" class="button" name="button" value="Szűrés"/>

                </form>
                </div>
                <div class="callout">
                    <h6>Előadó kiválasztása</h6>
                    <hr style="margin-top: 0rem; margin-bottom: 0.5rem;">
                    <form>
                        <select name="performer">
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
                </div>

            </div> <!-- close medium-3 medium-cell-block-y -->

            <div class="cell medium-10 medium-cell-block-y">
                <br>
                <h5 class="text-center">Lemezeink</h5>
                <hr>
                    <div class="grid-x grid-margin-x grid-margin-y">
                        <?php
                        $sql = "select * from album inner join performer on perform_id = performer_id inner join music_genre on genr_id = genre_id inner join grading on grd_id = grade_id inner join available on avb_id = avbl_id order by performer";
                         if (isset($_GET['genre'], $_GET['avbl'])) {
                             if ($_GET['avbl']=="0"){
                                 $sql .= $_GET['genre'] != 0 ? " WHERE genre_id=".$_GET['genre'] : "";
                                 $sql .= " ORDER BY performer";
                             } else {
                                 $sql .= $_GET['genre'] != 0 ? " WHERE genre_id=".$_GET['genre'] : "";
                                 $sql .= " AND avbl_id=".$_GET['avbl'];
                                 $sql .= " ORDER BY performer";
                             }
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
                            echo "<div class=\"cell small-12 large-2\">
                        <div class=\"card card-reveal-wrapper\">
                          <img src=\"{$row['path']}{$row['filename']}\">
                          <div class=\"card-section\">
                            <i class=\"fa fa-angle-up open-button\"><span class=\"show-for-sr\">More</span></i>
                                <p class='text-center small'>{$row['performer']}<br>
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
                    </div> <!-- /.small12large3 -->";

                        }
                        ?>
            </div> <!-- close medium-3 medium-cell-block-y -->
        </div> <!-- close grid-x grid-padding-x -->
    </div> <!-- close cell medium-auto medium-cell-block-container -->
</div> <!-- close grid-y medium-grid-frame -->

        <?php
        printHTML('html/footer.html');
        $con -> close();
        ?>
