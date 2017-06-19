import { Component, OnInit } from '@angular/core';
import { Broker } from 'eits-ng2';
import { Router, ActivatedRoute } from '@angular/router';
import { TdDialogService } from '@covalent/core';
import { Subscription } from 'rxjs/Rx';
/**
 *
 */
@Component( {
    selector: 'FuncionarioFormulario',
    templateUrl: './funcionario-formulario.component.html'
})
export class FuncionarioFormulario
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
    funcionario:any = {};

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
       Broker.of("funcionarioServico").promise("buscarFuncionarioPorId", this.id)
           .then( (result) => {
               this.funcionario = result;
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

    ngOnInit() {
    }

    ngOnDestroy(){
      this.inscricao.unsubscribe();
    }

    soNumero(event) {
      return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57;
    }

    private voltarListagem(){
      this.router.navigate(['/funcionario-listagem']);
    }

    public onSalvar():void
    {
      this.funcionario.dataNascimento = new Date(this.funcionario.dataNascimento+" 12:00:00 GMT");
      console.log(JSON.stringify(this.funcionario));

      Broker.of("funcionarioServico").promise(((this.id > 0) ? "alterar" : "inserir") + "Funcionario", this.funcionario)
            .then( (result) => {
              console.log(result);
              this.funcionario = result;
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
          Broker.of("funcionarioServico").promise("removerFuncionario", this.id)
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
