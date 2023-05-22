<?php
session_start();
if(!isset($_SESSION["prenom"])){
    header("location:connexion.php");
}
$niveau = $_SESSION["niveau"];
$pseudo = $_SESSION["pseudo"];
$id = mysqli_connect("localhost:3307","root","","chat");
$req = "delete from messages where destinataire = '$pseudo'";
if($niveau == 2){
    $req = "delete from messages";
}
mysqli_query($id,$req);
header("location:chat.php");
?>