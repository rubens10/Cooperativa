import { Component, OnInit } from '@angular/core';
import { Broker } from 'eits-ng2';
import { ITdDynamicElementConfig, TdDynamicElement, TdDynamicType } from '@covalent/dynamic-forms';
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
    elements: ITdDynamicElementConfig[];
    excluirRegistro:Boolean;
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

    private voltarListagem(){
      this.router.navigate(['/funcionario-listagem']);
    }

    private criarFormulario(){
      console.log(JSON.stringify(this.funcionario));

      this.elements = [
       {
         name: 'id',
         label: 'ID',
         default: this.funcionario.id,
         type: TdDynamicElement.Input,
         required: false,
       },
       {
         name: 'nome',
         label: 'Nome',
         default: this.funcionario.nome,
         type: TdDynamicElement.Input,
         required: true,
       },
       {
         name: 'rg',
         label: 'RG',
         default: this.funcionario.rg,
         type: TdDynamicElement.Input,
         required: true,
       },
       {
         name: 'cpf',
         label: 'CPF',
         default: this.funcionario.cpf,
         type: TdDynamicElement.Input,
         required: true,
       },
       {
         name: 'dataNascimento',
         label: 'Data Nascimento',
         default: (this.funcionario.dataNascimento) ? this.funcionario.dataNascimento.getDate()+"/"+(this.funcionario.dataNascimento.getMonth()+1)+"/"+this.funcionario.dataNascimento.getFullYear() : "",
         type: TdDynamicElement.Input,
         required: true,
       },
       {
         name: 'telefone',
         label: 'Telefone',
         default: this.funcionario.telefone,
         type: TdDynamicElement.Input,
         required: true,
       },
       {
         name: 'celular',
         label: 'Celular',
         default: this.funcionario.celular,
         type: TdDynamicElement.Input,
         required: true,
       },
       {
         "name": "ativo",
         "label": "Ativo",
         default: this.funcionario.ativo,
         "type": TdDynamicType.Boolean
       },
      ];
    }

    public onSalvar():void
    {

      if(document.forms["0"].className.indexOf('ng-valid') > 0) {
        Broker.of("funcionarioServico").promise("getInstancia")
            .then( (result) => {
              this.funcionario = result;
              this.funcionario.id = (this.id > 0) ? this.id : 0;
              this.funcionario.nome = document.forms["0"][1].value;
              this.funcionario.rg = document.forms["0"][2].value;
              this.funcionario.cpf = document.forms["0"][3].value;
              this.funcionario.dataNascimento = new Date();
              this.funcionario.telefone = document.forms["0"][5].value;
              this.funcionario.celular = document.forms["0"][6].value;
              this.funcionario.ativo = document.forms["0"][7].checked;
              this.funcionario.excluido = false;
              console.log(JSON.stringify(this.funcionario));

              Broker.of("funcionarioServico").promise("salvarFuncionario", this.funcionario)
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
    public onExcluir():void
    {
      this._dialogService.openConfirm( {
        message: 'Tem certeza que deseja excluir?',
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
