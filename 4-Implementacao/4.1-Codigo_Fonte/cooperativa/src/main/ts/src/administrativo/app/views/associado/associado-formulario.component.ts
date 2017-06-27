import { Component, OnInit } from '@angular/core';
import { Broker } from 'eits-ng2';
import { Router, ActivatedRoute } from '@angular/router';
import { TdDialogService } from '@covalent/core';
import { Subscription } from 'rxjs/Rx';

/**
 *
 */
@Component( {
    selector: 'AssociadoFormulario',
    templateUrl: './associado-formulario.component.html'
})
export class AssociadoFormulario
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
  associado:any = {};
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
      Broker.of("associadoServico").promise("buscarAssociadoPorId", this.id)
            .then( (result) => {
              //console.log(result);
              this.associado = result;

              this.carregarEstado();
              this.estado = this.associado.cidade.estado.id;
              this.carregarCidade();
              this.cidade = this.associado.cidade.id;
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
      this.alterarRegistro = true;
    }
  }

  ngOnInit() {
    this.carregarEstado();
  }

  ngOnDestroy(){
   this.inscricao.unsubscribe();
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

  soNumero(event) {
    return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57;
  }

  private voltarListagem(){
    this.router.navigate(['/associado-listagem']);
  }

  public onSalvar():void
  {
    this.associado.dataNascimento = new Date(this.associado.dataNascimento+" 12:00:00 GMT");
    console.log(JSON.stringify(this.associado));
    Broker.of("associadoServico").promise(((this.id > 0) ? "alterar" : "inserir") + "Associado", this.associado, this.cidade)
          .then( (result) => {
            console.log(result);
            this.associado = result;
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
        Broker.of("associadoServico").promise("removerAssociado", this.id)
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
