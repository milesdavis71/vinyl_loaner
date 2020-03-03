<?php

// Debuggoláshoz Dump & Die -> egy var_dump után megállítja a programot.
function dd($var) {
    var_dump($var);
    die();
}

function isLogged() {
    if (!empty($_SESSION['fid'])) {
        return true;
    } else {
        return false;
    }
}
// file_get_contents -> fájl tartalmát stringbe olvassa.
function printHTML($html) {
    echo file_get_contents($html);
}

// A menü kialakítása úgy, hogy amikor a be van valaki jelentkezve, akkor
//function printMenu() {
//    $menu = file_get_contents('html/menu.html');
//    if (isLogged()) {
//        $menu = str_replace('::ki_belepes',
//
//    '<li style="margin-top: 8px"><a href="zenei_adatbazis.php">Hanglemezeink</a></li>
//            <li style="margin-top: 8px"><a href="#0">Elérhetőségeink</a></li>
//            <li style="margin-top: 8px"><a href="logout.php">Kilép</a></ul></li>
//                </ul>', $menu);
//    } else {
//        $menu = str_replace('::ki_belepes',
//            '
//                    <li style="margin-top: 8px"><a href="#0" data-open="exampleModal1">Hanglemezeink</a></li>
//                    <div class="reveal" id="exampleModal1" data-reveal>
//                        <h1>Awesome. I Have It.</h1>
//                        <p class="lead">Your couch. It is mine.</p>
//                        <p>I\'m a cool paragraph that lives inside of an even cooler modal. Wins!</p>
//                        <button class="close-button" data-close aria-label="Close modal" type="button">
//                            <span aria-hidden="true">&times;</span>
//                        </button>
//                    </div>
//                    <li style="margin-top: 8px"><a href="#0">Elérhetőségeink</a></li>
//            <li style="margin-top: 8px">
//            <a href="login.php">Belép</a> </li> </ul></div>', $menu);
//    }
//    return $menu;
//}

function printMenuFix() {
    $menu = file_get_contents('html/menu_sticky.html');
    if (isLogged()) {
        $menu = str_replace('::ki_belepes',

            '<li style="margin-top: 8px"><a href="albums.php">Hanglemezeink</a></li>
            <li style="margin-top: 8px"><a href="#0">Elérhetőségeink</a></li>
            <li style="margin-top: 8px"><a href="logout.php">Kilép</a></ul></li>
                </ul>', $menu);
    } else {
        $menu = str_replace('::ki_belepes',
            '
                    <li style="margin-top: 8px"><a href="#0" data-open="exampleModal1">Hanglemezeink</a></li>
                    <div class="reveal" id="exampleModal1" data-reveal>
                        <h1>Awesome. I Have It.</h1>
                        <p class="lead">Your couch. It is mine.</p>
                        <p>I\'m a cool paragraph that lives inside of an even cooler modal. Wins!</p>
                        <button class="close-button" data-close aria-label="Close modal" type="button">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <li style="margin-top: 8px"><a href="#0">Elérhetőségeink</a></li>
            <li style="margin-top: 8px">
            <a href="login.php">Belép</a> </li> </ul></div>', $menu);
    }
    return $menu;
}
