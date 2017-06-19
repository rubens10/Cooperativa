import { Component, OnInit } from '@angular/core';
import { Broker } from 'eits-ng2';
import { Router, ActivatedRoute } from '@angular/router';
import { TdDialogService } from '@covalent/core';
import { Subscription } from 'rxjs/Rx';
/**
 *
 */
@Component( {
    selector: 'FarmaciaFormulario',
    templateUrl: './farmacia-formulario.component.html'
})
export class FarmaciaFormulario
{
    /*-------------------------------------------------------------------
     *                           ATTRIBUTES
     *-------------------------------------------------------------------*/
    /**
     *
     */
    id:any = 0;
    inscricao: Subscription;
    alterarRegistro:Boolean;
    farmacia:any = {};
    estado:any;
    cidade:any;
    private estados:Array<any> = new Array();
    private cidades:Array<any> = new Array();

    /*-------------------------------------------------------------------
     *                           BEHAVIORS
     *-------------------------------------------------------------------
    /**
     *
     */
    constructor(private router: Router, private route: ActivatedRoute, private _dialogService: TdDialogService){
      this.inscricao = this.route.params.subscribe(
        (params:any) => {
          this.id = Number(params['id']);
        }
      );

      if(this.id > 0) {
        Broker.of("farmaciaServico").promise("buscarFarmaciaPorId", this.id)
            .then( (result) => {
                this.farmacia = result;

                this.carregarEstado();
                this.estado = this.farmacia.cidade.estado.id;
                this.carregarCidade();
                this.cidade = this.farmacia.cidade.id;
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
      else {
        this.alterarRegistro = true; //botão excluir invisivel
      }
    }

    carregarEstado(){
      Broker.of("enderecoServico").promise("buscarEstado", "")
            .then( (result) => {
              this.estados = result["content"];
            })
            .catch( (message) => {
              this._dialogService.openAlert({
                message: message,
                title: 'Alerta',
                closeButton: 'OK',
              });
            });
    }

    carregarCidade(){
      if(this.estado > 0) {
        Broker.of("enderecoServico").promise("buscarCidade", this.estado)
              .then( (result) => {
                this.cidades = result["content"];
              })
              .catch( (message) => {
                this._dialogService.openAlert({
                  message: message,
                  title: 'Alerta',
                  closeButton: 'OK',
                });
              });
      }
    }

    ngOnInit() {
      this.carregarEstado();
    }

    ngOnDestroy(){
      this.inscricao.unsubscribe();
    }
    private voltarListagem(){
      this.router.navigate(['/farmacia-listagem']);
    }

    public onSalvar():void
    {
      Broker.of("farmaciaServico").promise(((this.id > 0) ? "alterar" : "inserir") + "Farmacia", this.farmacia, this.cidade)
            .then( (result) => {
              console.log(result);
              this.farmacia = result;
              this.voltarListagem();
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

    public onExcluir():void
    {
      this._dialogService.openConfirm( {
        message: 'Tem certeza que deseja inativar?',
        disableClose: false,
        title: 'Confirmação',
        cancelButton: 'Não',
        acceptButton: 'Sim',
      }).afterClosed().subscribe((accept: boolean) => {
        if (accept) {
          Broker.of("farmaciaServico").promise("removerFarmacia", this.id)
                .then( (result) => {
                  console.log(result);
                  this.voltarListagem();
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
      });
    }
}
