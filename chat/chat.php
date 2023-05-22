<?php
session_start();
if(!isset($_SESSION["prenom"])){
    header("location:connexion.php");
}
$pseudo = $_SESSION["pseudo"];
//Connexion au server mysql
$id = mysqli_connect("localhost:3307","root","","chat");
if(isset($_POST["bout"])){
    $destinataire = $_POST["destinataire"];
    $message = $_POST["message"];
    $req = "insert into messages values (null,'$pseudo','$message',now(), '$destinataire')";
    mysqli_query($id,$req);
}

$req = "select * from messages 
        where destinataire = '$pseudo'
        or destinataire = 'tous'
        order by date";
//Execution de la requete
$resultat = mysqli_query($id, $req);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Bonjour <?=$_SESSION["prenom"]?>, Chattez'en direct! Chatbox
        <a href="deconnexion.php">Deconnexion</a><a href="raz.php">Supp</a></h1>
        </header>
        <div class="messages">
            <ul>
                <?php
                while($ligne = mysqli_fetch_assoc($resultat)){
                  echo "<li class='message'>".$ligne["date"]." - ".$ligne["pseudo"]." - ".$ligne["message"]."</li>";
                }
                ?>
            </ul>
        </div>
        <div class="formulaire">
            <form action="" method="post">
                
                <input type="text" name="message" placeholder="Message :" required>
                <select name="destinataire">
                    <option value="tous"> Tous </option>
                    <?php
                    $req = "select * from user order by pseudo";
                    $res = mysqli_query($id, $req);
                    while($ligne = mysqli_fetch_assoc($res)){
                        $pseu = $ligne["pseudo"];
                        echo "<option value='$pseu'> $pseu </option>";
                    }
                    ?>
                </select>
                <input type="submit" value="Envoyer" name="bout">
            </form>
        </div>
    </div>
</body>
</html>