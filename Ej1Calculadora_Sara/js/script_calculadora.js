//definimos constante sy variables
const botonNumeros = document.getElementsByName('data-number');
const botonOpera = document.getElementsByName('data-opera');
const botonIgual = document.getElementsByName('data-igual')[0];
const botonDelete = document.getElementsByName('data-delete')[0];

var resultado = document.getElementById('resultado');

//guardamos la operacionActual y operacionAmnterior de las operaciones
var opeActual = '';
var opeAnterior = '';
var operacion = undefined;
clear();

//captura de los eventos de los botones

botonNumeros.forEach(function(boton){
	boton.addEventListener('click', function(){
		agregarNumero(boton.innerText);
		
	});
});

botonOpera.forEach(function(boton){
	boton.addEventListener('click', function(){
		seleccionarOperacion(boton.innerText);
		
	});
});

botonIgual.addEventListener('click', function(){
	calcular();
	actualizarDisplay();
});

botonDelete.addEventListener('click', function(){
	clear();
	actualizarDisplay();
});



//implementamos los métodos



function agregarNumero(num){
	opeActual = opeActual.toString() + num.toString();
	actualizarDisplay();
}
// Escribir en la caja de Resultado
function actualizarDisplay(){
	resultado.value = opeActual;
}

function clear(){
	opeActual = '';
	opeAnterior = '';
	operacion = undefined;
}

function seleccionarOperacion(op){
	if(opeActual == '') return;
	if(opeAnterior !== ''){
		calcular();
	}
	operacion = op.toString();
	opeAnterior = opeActual;
	opeActual = '';

}
 // Calculos, operaciones
function calcular(){
	var calculo ;
	const anterior = parseFloat(opeAnterior);
	const actual = parseFloat(opeActual);

	if(isNaN(anterior) || isNaN(actual)) return;

	switch(operacion){
		case '+':
			calculo = anterior + actual;
			break;
		case '-':
			calculo = anterior - actual;
			break;
		case '*':
			calculo = anterior * actual;
			break;
		case '/':
			calculo = anterior / actual;
			break;
		default:
			return;
	}
	opeActual = calculo,
	operacion = undefined;
	opeAnterior = '';
}










