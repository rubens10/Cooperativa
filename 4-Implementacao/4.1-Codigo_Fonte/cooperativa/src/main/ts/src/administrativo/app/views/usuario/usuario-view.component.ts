import { Component, OnInit } from '@angular/core';
import { HttpModule, Http, Headers } from '@angular/http';
import { Broker } from 'eits-ng2';
import { TdDialogService } from '@covalent/core';


import { UsuarioFormulario } from './usuario-formulario.component';

/**
 *
 */
@Component(
  {
    selector: 'usuario-root',
    templateUrl: './usuario-view.component.html',
  }
)
export class UsuarioView //implements OnInit
{

    /*-------------------------------------------------------------------
     *                           ATTRIBUTES
     *-------------------------------------------------------------------*/
    /**
     *
     */
    private usuarios:Array<any> = new Array();

    /*-------------------------------------------------------------------
     *                           BEHAVIORS
     *-------------------------------------------------------------------*/
    /**
     *
     */
     constructor(/*private route: ActivatedRoute,*/ private _dialogService: TdDialogService){
       Broker.of("usuarioServico").promise("buscarUsuariosExcluidos", "false")
           .then( (result) => {
               this.usuarios = result.content;
               //console.log(this.usuario);
           })
           .catch( (message) => {
             this._dialogService.openAlert({
                 message: message,
                 title: 'Alerta',
                 closeButton: 'OK',
             });
           }
       );
     }

     public onBuscar(termo:any):void
     {
       Broker.of("usuarioServico").promise("buscarUsuariosPorFiltros", termo)
             .then( (result) => {
               //console.log(result.content);
               this.usuarios = result.content;
             })
             .catch( (message) => {
               this._dialogService.openAlert({
                   message: message,
                   title: 'Alerta',
                   closeButton: 'OK',
               });
             }
         );

     }
}
