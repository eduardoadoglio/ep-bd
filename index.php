<?php
    include("template/header.php");
    include("template/menu.php");
    require_once("model/GrupoMilitar.php");
    require_once("model/ConflitoBelico.php");
    require_once("model/OrganizacaoMediadora.php");
    require_once("model/Pais.php");
    require_once("utils/utils.php");
    $grupoMili = new GrupoMilitar();
    $gruposMili = $grupoMili->getGrupoMilitarByGun();
    $conflito = new ConflitoBelico();
    $conflitos = $conflito->getConflitoBelicoOrderdByDeaths();
    $organizacao = new OrganizacaoMediadora();
    $organizacoes = $organizacao->getOrganizacoesOrderdByNumbers();
    $gruposMiliByGuns = $grupoMili->getGrupoMilitarByGunNumber();
    $pais = new Pais();
    $paises = $pais->getPaisByReligiousConflict();
    $utils = new Utils();
?>
<body>
<div class="home-hero">
    <div class="hero-text">
        <h1>Conflitos Bélicos</h1>
        <p>Aplicação para cadastrar e buscar conflitos bélicos</p>    
    </div>
    <button><a href="#main-content" >V</a></button>
</div>
<div class="container-fluid" id="main-content">
    <section class="services-section">
        <div class="services-title">
            <h2>Cadastros</h2>
            <span>Aqui é possível realizar o cadastro das seguintes categorias</span>
        </div>
        <div class="row justify-content-center services-box">
            <div class="service col-md-2" id="services">
                <div class="service-content">
                    <div class="service-image">
                        <img src="/assets/image/conflitoBelicoIcon.png">
                    </div>
                    <h3>Conflitos bélicos</h3>
                    <hr>
                    <p>
                        Cadastre um conflito bélico
                    </p>
                    <a href="/view/conflito/createConflitoBelico.php"><button>CADASTRAR</button></a>
                </div>
            </div>
            <div class="service col-md-2">
            <div class="service-content">
                    <div class="service-image">
                        <img src="/assets/image/grupoMilitarIcon.png">
                    </div>
                    <h3>Grupos militares</h3>
                    <hr>
                    <p>
                        Cadastre um grupos militares
                    </p>
                    <a href="view/grupoMilitar/createGrupoMilitar.php"><button>CADASTRAR</button></a>
                </div>
            </div>
            <div class="service col-md-2">
                <div class="service-content">
                    <div class="service-image">
                        <img src="/assets/image/divisaoIcon.png">
                    </div>
                    <h3>Divisões</h3>
                    <hr>
                    <p>
                        Cadastre uma divisão
                    </p>
                    <a href="view/divisao/createDivisao.php"><button>CADASTRAR</button></a>
                </div>
            </div>
        </div>
        <div class="row justify-content-center services-box">
            <div class="service col-md-2">
                <div class="service-content">
                    <div class="service-image">
                        <img src="/assets/image/liderPoliticoIcon.png">
                    </div>
                    <h3>Líderes políticos</h3>
                    <hr>
                    <p>
                        Cadastre um lider político
                    </p>
                    <a href="view/liderPolitico/createLiderPolitico.php"><button>CADASTRAR</button></a>
                </div>
            </div>
            <div class="service col-md-2">
            <div class="service-content">
                    <div class="service-image">
                        <img src="/assets/image/chefeMilitarIcon.png">
                    </div>
                    <h3>Chefe militar</h3>
                    <hr>
                    <p>
                        Cadastre um chefe militar
                    </p>
                    <a href="view/chefeMilitar/createChefeMilitar.php"><button>CADASTRAR</button></a>
                </div>
            </div>
        </div>
    </section>
    <section class="content-section">
        <div class="contents-title">
            <h2>Buscas</h2>
            <span>Aqui realizaremos todas as buscas requisitadas</span>
        </div>    
        <div class="row content content-left">
            <div class="content-text col-md-8">
                <h3>Listar os traficantes e os grupos armados (Nome) para os quais os traficantes fornecem armas “Barret M82” ou “M200 intervention”</h3>
                <?php $utils->IndexQueryLists($gruposMili, 'Grupo Armado/Fornece'); ?>
                
            </div>
            <div class="content-image col-md-4">
            </div>
        </div>
        <div class="row content content-right">
            <div class="content-image col-md-4">
            </div>
            <div class="content-text col-md-8">
            <h3>Listar os 5 maiores conflitos em número de mortos</h3>
            <?php $utils->IndexQueryLists($conflitos, 'Conflito'); ?>
            </div>
        </div>
        <div class="row content content-left">
            <div class="content-text col-md-8">
            <h3>Listar as 5 maiores organizações em número de mediações</h3>
            <?php $utils->IndexQueryLists($organizacoes, 'Organizacao Mediadora'); ?>
            </div>
            <div class="content-image col-md-4">  
            </div>
        </div>
        <div class="row content content-right">
            <div class="content-image col-md-4">
            </div>
            <div class="content-text col-md-8">
            <h3>Listar os 5 maiores grupos armados com maior número de armas fornecidos.</h3>
            <?php $utils->IndexQueryLists($gruposMiliByGuns, 'Grupo Militar/Fornece'); ?>
            </div>
        </div>
        <div class="row content content-left">
            <div class="content-text col-md-8">
            <h3>Listar o país e número de conflitos com maior número de conflitos religiosos.</h3>
            <?php $utils->IndexQueryLists($paises, 'Pais/Conflito Religioso'); ?>
            </div>
            <div class="content-image col-md-4">
            </div>
        </div>
        <div class="row content content-center">
            <div class="content-text col-md-12">
            <h3>Histograma</h3>
            <div class="chart-container">
                <canvas id="histograma" width="400" height="400"></canvas>
            </div>
            <!-- <?php //$utils->IndexQueryLists($gruposMiliByGuns, 'Grupo Militar/Fornece'); ?> -->
            </div>
        </div>
    </section>
    
</div>


</body>
<?php
    $allConflitos = $conflito->generateConflitoHistogramArray();
?>
<script>
    var ctx = document.getElementById('histograma').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: <?php echo json_encode(array_keys($allConflitos)); ?>,
            datasets: [{
                label: ['Número de conflitos'],
                data: <?php echo json_encode(array_values($allConflitos)); ?>,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
</script>

<?php
    include("template/footer.php");
?>
</html>