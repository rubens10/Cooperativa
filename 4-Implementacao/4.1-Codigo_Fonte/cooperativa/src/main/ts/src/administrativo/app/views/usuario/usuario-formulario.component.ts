import { Component, OnInit } from '@angular/core';
import { Broker } from 'eits-ng2';
import { Router, ActivatedRoute } from '@angular/router';
import { TdDialogService } from '@covalent/core';
import { Subscription } from 'rxjs/Rx';
/**
 *
 */
@Component( {
    selector: 'UsuarioFormulario',
    templateUrl: './usuario-formulario.component.html'
})
export class UsuarioFormulario
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
    usuario:any = {};
    confirmarSenha:any;

    private perfis:Array<any> = [
       { id: 0, nome: 'ADMINISTRADOR' },
       { id: 1, nome: 'COMERCIAL' },
       { id: 2, nome: 'FINANCEIRO' },
       { id: 3, nome: 'ASSOCIADO' },
       { id: 4, nome: 'ATENDENTE' },
     ];

    /*-------------------------------------------------------------------
     *                           BEHAVIORS
     *-------------------------------------------------------------------
    /*
     *
     */
    private voltarListagem(){
      this.router.navigate(['/usuario-listagem']);
    }

    constructor(private router: Router, private route: ActivatedRoute, private _dialogService: TdDialogService){
      this.inscricao = this.route.params.subscribe(
        (params:any) => {
          this.id = Number(params['id']);
        }
      );

      if(this.id > 0) {
        Broker.of("usuarioServico").promise("buscarUsuarioPorId", this.id)
            .then( (result) => {
                  this.usuario = result;
                  console.log(JSON.stringify(result));
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

    public onSalvar():void
    {
      console.log(JSON.stringify(this.usuario));
      Broker.of("usuarioServico").promise(((this.id > 0) ? "alterar" : "inserir") + "Usuario", this.usuario)
            .then( (result) => {
              console.log(result);
              this.usuario = result;
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
    public onExcluir(registro):void
    {
      this._dialogService.openConfirm( {
        message: 'Tem certeza que deseja inativar?',
        disableClose: false,
        title: 'Confirmação',
        cancelButton: 'Não',
        acceptButton: 'Sim',
      }).afterClosed().subscribe((accept: boolean) => {
        if (accept) {
          Broker.of("usuarioServico").promise("removerUsuario", this.id)
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
