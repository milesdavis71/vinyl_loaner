<?php
// egyszer elindítja az init.php-t. Akkor kell-a require_once, hogy ha valamit
// kötelező elindítani a php futtatása elején, és biztosnak kell lenni abban,
// hogy csak egyszer töltődött be.
require_once('config/init.php');

printHTML('html/header.html');
echo printMenuFix();
printHTML('html/slider.html');
?>

<div class="grid-container">
    <h2 class="text-center subheader">Legújabb lemezeink</h2>
    <hr>
    <div class="grid-x grid-margin-x grid-margin-y">

        <?php
        //        $sql = "select * from album inner join performer on perform.id = performerid inner join mufaj on mufid = mufajid order by album.id desc limit 12";

        //$sql = "select * from album inner join performer on perform.id = performerid inner join music_genre on genr.id = genre.id";

        $sql = "select * from album inner join performer on perform_id = performer_id";


        $result = $con -> query($sql);

        if (!$result){
            die("Eredménytelen a lekérdezés!");
        }

        // TODO kártyák abc sorrendbe, nézd meg a galáriás projektetm, ott egy result array-be van visszahívva az echo

        while ($row = $result -> fetch_assoc()) {
            echo "<div class=\"cell small-6 large-2\">
                <div class=\"card card-reveal-wrapper\">
                  <img src=\"{$row['path']}{$row['filename']}\">
                  <div class=\"card-section\">
                        <p class='text-center'>{$row['performer']}<br>
                        {$row['title_of_record']}</p>
                    
                    </div> <!-- /.card-reveal -->
                  </div> <!-- /.card-section -->
                </div> <!-- /.card -->";

        }
        ?>
    </div>
</div>



<?php
printHTML('html/footer.html');
?>

