import { Component, OnInit } from '@angular/core';
import { HttpModule, Http, Headers } from '@angular/http';
import { Broker } from 'eits-ng2';
import { TdDialogService } from '@covalent/core';


import { FarmaciaFormulario } from './farmacia-formulario.component';

/**
 *
 */
@Component(
  {
    selector: 'farmacia-root',
    templateUrl: './farmacia-view.component.html',
  }
)
export class FarmaciaView //implements OnInit
{

    /*-------------------------------------------------------------------
     *                           ATTRIBUTES
     *-------------------------------------------------------------------*/
    /**
     *
     */
    private farmacias:Array<any> = new Array();

    /*-------------------------------------------------------------------
     *                           BEHAVIORS
     *-------------------------------------------------------------------*/
    /**
     *
     */
     constructor(/*private route: ActivatedRoute,*/ private _dialogService: TdDialogService){
       Broker.of("farmaciaServico").promise("buscarFarmaciasPorFiltros", "")
           .then( (result) => {
               this.farmacias = result.content;
               //console.log(this.farmacia);
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
       Broker.of("farmaciaServico").promise("buscarFarmaciasPorFiltros", termo)
             .then( (result) => {
               //console.log(result.content);
               this.farmacias = result.content;
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
