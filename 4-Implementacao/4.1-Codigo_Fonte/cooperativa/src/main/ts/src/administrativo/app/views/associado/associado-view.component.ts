import { Component, OnInit } from '@angular/core';
import { HttpModule, Http, Headers } from '@angular/http';
import { Broker } from 'eits-ng2';
import { TdDialogService } from '@covalent/core';


import { AssociadoFormulario } from './associado-formulario.component';

/**
 *
 */
@Component(
  {
    selector: 'associado-root',
    templateUrl: './associado-view.component.html',
  }
)
export class AssociadoView //implements OnInit
{

    /*-------------------------------------------------------------------
     *                           ATTRIBUTES
     *-------------------------------------------------------------------*/
    /**
     *
     */
    private associados:Array<any> = new Array();

    /*-------------------------------------------------------------------
     *                           BEHAVIORS
     *-------------------------------------------------------------------*/
    /**
     *
     */
     constructor(/*private route: ActivatedRoute,*/ private _dialogService: TdDialogService){
       Broker.of("associadoServico").promise("buscarAssociadosExcluidos", "false")
           .then( (result) => {
               this.associados = result.content;
               //console.log(this.associado);
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
       Broker.of("associadoServico").promise("buscarAssociadosPorFiltros", termo)
             .then( (result) => {
               //console.log(result.content);
               this.associados = result.content;
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
