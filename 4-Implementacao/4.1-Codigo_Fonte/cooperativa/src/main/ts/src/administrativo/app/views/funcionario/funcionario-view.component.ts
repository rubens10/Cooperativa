import { Component, OnInit } from '@angular/core';
import { HttpModule, Http, Headers } from '@angular/http';
import { Broker } from 'eits-ng2';
import { TdDialogService } from '@covalent/core';

import { FuncionarioFormulario } from './funcionario-formulario.component';

/**
 *
 */
@Component(
  {
    selector: 'funcionario-root',
    templateUrl: './funcionario-view.component.html',
  }
)
export class FuncionarioView //implements OnInit
{

    /*-------------------------------------------------------------------
     *                           ATTRIBUTES
     *-------------------------------------------------------------------*/
    /**
     *
     */
    private funcionarios:Array<any> = new Array();

    /*-------------------------------------------------------------------
     *                           BEHAVIORS
     *-------------------------------------------------------------------*/
    /**
     *
     */
     constructor(/*private route: ActivatedRoute,*/ private _dialogService: TdDialogService){
       Broker.of("funcionarioServico").promise("buscarFuncionariosExcluidos", "false")
           .then( (result) => {
               this.funcionarios = result.content;
               //console.log(this.funcionario);
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
       Broker.of("funcionarioServico").promise("buscarFuncionariosPorFiltros", termo)
             .then( (result) => {
               //console.log(result.content);
               this.funcionarios = result.content;
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
