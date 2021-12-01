<?php
   // use with
   // http://localhost/.../.../validationXML.php?xml=Voiliers.xml
   $dom = new DOMDocument;
   $dom->load($_GET["xml"]);
   if ($dom->validate()) {
      echo "XML God";
   }
 ?>