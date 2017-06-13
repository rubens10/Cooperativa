import { Component, OnInit } from '@angular/core';
import { Broker } from 'eits-ng2';
import { ITdDynamicElementConfig, TdDynamicElement, TdDynamicType } from '@covalent/dynamic-forms';
import { FormGroup, FormControl/*, FormBuilder, Validators*/ } from '@angular/forms';
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
    elements: ITdDynamicElementConfig[];
    excluirRegistro:Boolean;
    usuario:any = {};

    /*-------------------------------------------------------------------
     *                           BEHAVIORS
     *-------------------------------------------------------------------
    /*
     *
     */
    private voltarListagem(){
      this.router.navigate(['/usuario-listagem']);
    }

    private criarFormulario(){
      console.log(JSON.stringify(this.usuario));

      this.elements = [
        {
          name: 'id',
          label: 'ID',
          default: this.usuario.id,
          type: TdDynamicElement.Input,
          required: false,
        },
        {
          name: 'email',
          label: 'E-mail',
          default: this.usuario.username,
          type: TdDynamicElement.Input,
          required: false,
        },
        {
          "name": "senha",
          "label": "Senha",
          "type": TdDynamicElement.Password,
          "required": true
        },
        {
          name: 'perfil',
          label: 'Perfil',
          type: TdDynamicType.Array,
          selections: [
            "ASSOCIADO","ADMINISTRADOR","ATENDENTE","COMERCIAL","FINANCEIRO"
          ],
          default: this.usuario.perfil,
        },
        {
          "name": "ativo",
          "label": "Ativo",
          default: this.usuario.ativo,
          "type": TdDynamicType.Boolean
        },
      ];
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
                this.criarFormulario();
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
        this.criarFormulario();
        this.excluirRegistro = true; //botão excluir invisivel
      }
    }

    ngOnInit() {
    }

    ngOnDestroy(){
      this.inscricao.unsubscribe();
    }

    public onSalvar():void
    {
      if(document.forms["0"].className.indexOf('ng-valid') > 0) {
        Broker.of("usuarioServico").promise("getInstancia")
            .then( (result) => {
                this.usuario = result;
                this.usuario.id = (this.id > 0) ? this.id : 0;
                this.usuario.email = document.forms["0"][1].value;
                this.usuario.senha = document.forms["0"][2].value;
                this.usuario.perfil = document.all["perfil"].outerText.replace('Perfil\n','').replace('\n','');
                this.usuario.ativo = document.forms["0"][3].checked;
                this.usuario.excluido = false;
                console.log(JSON.stringify(this.usuario));

                Broker.of("usuarioServico").promise("salvarUsuario", this.usuario)
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
    public onExcluir(registro):void
    {
      this._dialogService.openConfirm( {
        message: 'Tem certeza que deseja excluir?',
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
