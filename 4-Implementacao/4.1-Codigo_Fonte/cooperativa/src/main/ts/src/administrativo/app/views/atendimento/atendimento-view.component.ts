import { Component, OnInit } from '@angular/core';
import { HttpModule, Http, Headers } from '@angular/http';
import { Broker } from 'eits-ng2';
import { TdDialogService } from '@covalent/core';

import { AtendimentoFormulario } from './atendimento-formulario.component';
/**
 *
 */
@Component(
  {
    selector: 'atendimento-root',
    templateUrl: './atendimento-view.component.html',
  }
)
export class AtendimentoView //implements OnInit
{

    /*-------------------------------------------------------------------
     *                           ATTRIBUTES
     *-------------------------------------------------------------------*/
    /**
     *
     */
    private atendimentos:Array<any> = new Array();

    /*-------------------------------------------------------------------
     *                           BEHAVIORS
     *-------------------------------------------------------------------*/
    /**
     *
     */
     constructor(/*private route: ActivatedRoute,*/ private _dialogService: TdDialogService){
       Broker.of("atendimentoServico").promise("buscarAtendimentosPorFiltros", "")
           .then( (result) => {
               this.atendimentos = result.content;
               //console.log(this.atendimentos);
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
       Broker.of("atendimentoServico").promise("buscarAtendimentosPorFiltros", termo)
             .then( (result) => {
               //console.log(result.content);
               this.atendimentos = result.content;
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
