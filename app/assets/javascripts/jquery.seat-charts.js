$(document).ready(function() {
    var sala123 = document.getElementById("sala123");
    var seatid = [];
    var asientoselegidos = [];
    var asiestosreservados = $('#ocupados').val();
    var ponerreservados = '';
    var aux = 0;
    var asientoscomprados = $('#comprados').val();
    var ponercomprados =  '';
    for (var i = 0; i < asiestosreservados.length + 1 ; i++){
        if(i == asiestosreservados.length == false) {
            if (asiestosreservados[i] == ' ' || aux == 3) {
                aux = 0;
                $('#' + ponerreservados).addClass('reservado');
                ponerreservados = '';
            } else {
                ponerreservados += asiestosreservados[i];
                aux = aux + 1;
            }
        } else {
            $('#' + ponerreservados).addClass('reservado');
            ponerreservados = '';
        }
    }
    aux = 0;
    for (i = 0; i < asientoscomprados.length + 1; i++){
        if(aux == 2){
            aux=0;
            $('#'+ponercomprados).addClass('unavailable');
            ponercomprados=''
        } else  {
            ponercomprados += asientoscomprados[i];
            aux++
        }
    }
    (function(){
        var sala = $('#show_sala').val();
        var show = $('#show_id').val();
        if (sala === 4){
            $('#sala4').show();
            $('#sala123').hide();
            $('#fijar-asiento').show()
        } else{
            $('#sala123').show();
            $('#sala4').hide();
            $('#fijar-asiento').show()
        }
    }())
    $('.seatCharts-seat').on('click', function() {
        id_seleccionado = $(this).attr("id");
        if ($(this).hasClass('selected')){
            $(this).removeClass('selected');
            seatid.splice(seatid.indexOf(id_seleccionado),1);
        } else{
            $(this).addClass('selected');
            seatid.push(id_seleccionado);
        }
    });

    $('#fijar-asiento').on('click', function(){
        asientoselegidos = seatid.toString();
        $('#reservation_seat').val(asientoselegidos);
        $('#purchase_seat').val(asientoselegidos);

    });



});