<?php

class Utils{

	function IndexQueryLists ($arlist, $nometabela) {
		if(count($arlist) > 0):
			echo '<table class="table-data">';
				echo '<thead>';
					echo '<tr>';
						
						foreach($arlist[0] as $key => $value){
							echo '<th>'.$key.'</th>';
						}
						
					echo '</tr>';
				echo '</thead>';
				echo '<tbody>';
						foreach($arlist as $sublist){
							echo '<tr>';
							foreach($sublist as $key => $value){
								echo '<td>'.$value.'</td>';
							}
							echo '</tr>';
						}
					echo '</tr>';
				echo '</tbody>';
			echo '</table>';
		else:
			echo '<div class="container-fluid">';
			    echo '<div class="row justify-content-center">';
			        echo '<div class="col-md-12">';
			            echo '<h1>Não há nenhuma tabela de '.$nometabela.' criada</h1>';
			        echo '</div>';
			    echo '</div>';
			echo '</div>';
		endif;
	}

}

?>