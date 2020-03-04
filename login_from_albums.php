<?php
// betölti az initet
require_once('config/init.php');
// ha a submit gomb megnyomása az $_POST superglobal tömmben mind2 értéke benn van (egyik se üres),
// de egy előző submit próbálkozás után a munkamenetben maradt login error,
// akkor, ha elment a post-tal az információ (két adat) a formba, akkor törli a 'loginError(oka)'-t.
// TODO nézd meg, hogy ha van egy sikeres belépés, akkor a sessionben benne van a fid, és akkor meg azt törli ilyenkor.
if (!empty($_POST['email']) && (!empty($_POST['password']))){
    if (isset($_SESSION['loginError'])){
        unset($_SESSION['loginError']);
    }
    $email = $_POST['email'];
    $pwd = $_POST['password'];
    // stmt -> statement -> prepared statement (sql injection ellen). bekéri a táblából a felhasznalo/jelszot (?);
    // de úgy, hogy megvéd az injection ellen.
    $sql = "SELECT user_id, user_email FROM user WHERE user_email = ? AND user_password = ?";
    $stmt = $con -> prepare($sql);
    $stmt -> bind_param('ss',$email, $pwd);
    $stmt -> execute();
    $stmt ->store_result();
    //dd($stmt);
    if ($stmt -> num_rows == 1){
        //belépett
        $stmt -> bind_result($id, $email);
        $stmt -> fetch();
        //dd($id);
        $_SESSION['fid'] = $id;

        header('Location: albums.php?genre=0&avbl=0');
    } else {
        // sikertelen belépéskor beírja a $_SESSION szuperglobal tömbjébe a hibaüzenetet.
        $_SESSION['loginError'] = "Helytelen belépési adatok!";
    }

}
printHTML('html/header.html');
echo printMenuFix();

printHTML('html/login_form_albums.html');
printHTML('html/footer.html');
$con -> close();

