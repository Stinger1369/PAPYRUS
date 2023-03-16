<!DOCTYPE html>
<html>

<head>
  <title>Interroger la base de données Papyrus</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.15/tailwind.min.css">
</head>

<body class="bg-gray-100">
  <div class="flex flex-row">
    <div class="w-1/4 px-4 py-10">
      <h2 class="text-lg font-bold mb-5">Requêtes possibles:</h2>
      <ul class="list-disc list-inside">
        <li><a href="#" class="text-blue-500">SELECT * FROM Vente;</a> - Affiche la table "VENTE".</li>
        <li><a href="#" class="text-blue-500">UPDATE VENTE
            SET PRIX1 = PRIX1 * 1.04, PRIX2 = PRIX2 * 1.02
            WHERE NUMFOU = 9180;
            ;</a> - Application d'une augmentation de tarif de 4% pour le prix 1, 2% pour le prix2 pour le fournisseur 9180.</li>
        <!-- Ajoutez d'autres requêtes ici avec leurs explications -->
      </ul>
    </div>
    <div class="w-3/4 px-4 py-10">
      <h1 class="text-3xl font-bold mb-5">Interroger la base de données Papyrus</h1>
      <form method="post">
        <div class="mb-4">
          <label class="block text-gray-700 font-bold mb-2" for="query">Saisissez votre requête SQL:</label>
          <textarea name="query" id="query" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" rows="5"></textarea>
        </div>
        <div class="flex items-center justify-between">
          <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit">
            Soumettre
          </button>
        </div>
      </form>

      <?php
      // Connexion à la base de données
      $pdo = new PDO('mysql:host=localhost;dbname=pa', 'root', '');

      // Traitement du formulaire de requête
      if (isset($_POST['query'])) {
        // Exécution de la requête
        $query = $_POST['query'];
        $stmt = $pdo->query($query);
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Affichage des résultats dans un tableau
        echo '<h2 class="text-2xl font-bold mt-10">Résultats:</h2>';
        if (count($results) > 0) {
          echo '<div class="mt-5">';
          echo '<table class="table-auto w-full">';
          echo '<thead>';
          echo '<tr class="bg-gray-200">';
          foreach ($results[0] as $key => $value) {
            echo '<th class="px-4 py-2">' . ucwords(str_replace('_', ' ', $key)) . '</th>';
          }
          echo '</tr>';
          echo '</thead>';
          echo '<tbody>';
          foreach ($results as $row) {
            echo '<tr class="border">';
            foreach ($row as $value) {
              echo '<td class="px-4 py-2">' . $value . '</td>';
            }
            echo '</tr>';
          }
          echo '</tbody>';
          echo '</table>';
          echo '</div>';
        } else {
          echo '<p class="mt-5">Aucun résultat trouvé.</p>';
        }
      }
      ?>
    </div>
  </div>
  <script>
    var textarea = document.getElementById("query");
    textarea.addEventListener("input", function() {
      this.value = this.value.toUpperCase();
    });
  </script>
</body>

</html>