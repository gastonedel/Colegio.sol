// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Estudiante{
string private _nombre;
string private _apellido;
string private _curso;
address private _docente;
mapping (string => uint8) private _notas_materias;
string[] private _nombre_materia;

constructor(string memory nombre_, string memory apellido_, string memory curso_){
    _nombre=nombre_;
    _apellido=apellido_;
    _curso=curso_;
    _docente=msg.sender;

}

function apellido() public view returns (string memory){
    return _apellido;
}

function AppendString(string memory a, string memory b, string memory c) public pure returns(string memory){
    return string(abi.encodePacked(a,b,c));
}

function nombre_completo() public view returns (string memory){
    return AppendString(_nombre, "" , _apellido);

}

function curso() public view returns (string memory){
return _curso;

}

function set_nota_materia(uint8 nota , string memory materia)public{


    require(_docente== msg.sender, "No es posible cambiar cambiar la nota");
    require(nota <= 100 && nota>1, "La nota puesta no es valida");
    _notas_materias[materia] = nota;
    _nombre_materia.push(materia);
}
function nota_materia(string memory materia) public view returns(uint8){
uint8 nota=_notas_materias[materia];
return nota;

}

function aprobo(string memory materia) public view returns (bool){
    return (_notas_materias[materia] >= 60);
}

function promedio() public view returns(uint){
    uint cantidadDeNotas=_nombre_materia.length;
    uint notaApromediar;
    uint notaFinalAlBoletin;

    for(uint i=0;i<cantidadDeNotas; i++){
        notaApromediar += _notas_materias[_nombre_materia[i]];


    }

    notaFinalAlBoletin=notaApromediar/cantidadDeNotas;
    return notaFinalAlBoletin;
}
}