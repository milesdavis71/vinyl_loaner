<br>
<div class="callout">
    <div class="polls">
        <h6>Műfaj kiválasztása</h6>
        <hr style="margin-top: 0rem; margin-bottom: 0.5rem;">
        <form action="" method="GET">
            <div>
                <input type="radio" name="genre" value="1" <?php if (isset($_GET['genre']) && $_GET['genre'] == '1')  echo ' checked="checked"';?> />
                <label>rock</label>
            </div>
            <div>
                <input type="radio" name="genre" value="2" <?php if (isset($_GET['genre']) && $_GET['genre'] == '2')  echo ' checked="checked"';?> />
                <label>jazz</label>
            </div>
            <div>
                <input type="radio" name="genre" value="3" <?php if (isset($_GET['genre']) && $_GET['genre'] == '3')  echo ' checked="checked"';?> />
                <label>klasszikus</label>
            </div>
            <div>
                <input type="radio" name="genre" value="4" <?php if (isset($_GET['genre']) && $_GET['genre'] == '4')  echo ' checked="checked"';?> />
                <label>elektronikus</label>
            </div>
            <div>
                <input type="radio" name="genre" value="0" <?php if (isset($_GET['genre']) && $_GET['genre'] == '0') echo ' checked="checked"';?> />
                <label>összes</label>
            </div>

            <h6 class="small" style="margin-top: 0.7rem;">Kölcsönzés állapota</h6>
            <hr style="margin-top: 0rem; margin-bottom: 0.5rem;">

            <div>
                <input type="radio" name="avbl" value="1" <?php if (isset($_GET['avbl']) && $_GET['avbl'] == '1')  echo ' checked="checked"';?> />
                <label>kikölcsönözhető</label>
            </div>
            <div>
                <input type="radio" name="avbl" value="2" <?php if (isset($_GET['avbl']) && $_GET['avbl'] == '2')  echo ' checked="checked"';?> />
                <label>nem kikölcsönözhető</label>
            </div>
            <div>
                <input type="radio" name="avbl" value="0" <?php if (isset($_GET['avbl']) && $_GET['avbl'] == '0')  echo ' checked="checked"';?> />
                <label>összes</label>
            </div>


            <input type="submit" class="hollow button expanded" name="button" value="Szűrés"/>

        </form>
    </div>
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
        <button type="submit" class="hollow button expanded">Szűrés</button>


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