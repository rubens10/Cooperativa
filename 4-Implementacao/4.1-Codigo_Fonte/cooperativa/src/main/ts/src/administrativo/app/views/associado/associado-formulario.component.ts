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
    elements: ITdDynamicElementConfig[];
    excluirRegistro:Boolean;
    associado:any = {};

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
               this.associado = result;
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
      this.router.navigate(['/associado-listagem']);
    }

    private criarFormulario(){
     console.log(JSON.stringify(this.associado));

     this.elements = [
       {
         name: 'id',
         label: 'ID',
         default: this.associado.id,
         type: TdDynamicElement.Input,
         required: false,
       },
       {
         name: 'nome',
         label: 'Nome',
         default: this.associado.nome,
         type: TdDynamicElement.Input,
         required: true,
       },
       {
         name: 'rg',
         label: 'RG',
         default: this.associado.rg,
         type: TdDynamicElement.Input,
         required: true,
       },
       {
         name: 'cpf',
         label: 'CPF',
         default: this.associado.cpf,
         type: TdDynamicElement.Input,
         required: true,
       },
       {
         name: 'dataNascimento',
         label: 'Data Nascimento',
         default: (this.associado.dataNascimento) ? this.associado.dataNascimento.getDate()+"/"+(this.associado.dataNascimento.getMonth()+1)+"/"+this.associado.dataNascimento.getFullYear() : "",
         type: TdDynamicElement.Input,
         required: true,
       },
       {
         name: 'telefone',
         label: 'Telefone',
         default: this.associado.telefone,
         type: TdDynamicElement.Input,
         required: true,
       },
       {
         name: 'celular',
         label: 'Celular',
         default: this.associado.celular,
         type: TdDynamicElement.Input,
         required: true,
       },
       {
         name: 'cep',
         label: 'CEP',
         default: this.associado.cep,
         type: TdDynamicElement.Input,
         required: true,
       },
       {
         name: 'logradouro',
         label: 'Logradouro',
         default: this.associado.logradouro,
         type: TdDynamicElement.Input,
         required: true,
       },
       {
         name: 'numero',
         label: 'Número',
         default: this.associado.numero,
         type: TdDynamicElement.Input,
         required: true,
       },
       {
         name: 'bairro',
         label: 'Bairro',
         default: this.associado.bairro,
         type: TdDynamicElement.Input,
         required: true,
       },
       {
         name: 'complemento',
         label: 'Complemento',
         default: this.associado.complemento,
         type: TdDynamicElement.Input,
         required: false,
       },
       {
         "name": "ativo",
         "label": "Ativo",
         default: this.associado.ativo,
         "type": TdDynamicType.Boolean
       },
     ];
    }

    public onSalvar():void
    {
      if(document.forms["0"].className.indexOf('ng-valid') > 0) {
        Broker.of("associadoServico").promise("getInstancia")
            .then( (result) => {
              console.log(JSON.stringify(result));
              this.associado = result;
              this.associado.id = (this.id > 0) ? this.id : 0;
              this.associado.nome = document.forms["0"][1].value;
              this.associado.rg = document.forms["0"][2].value;
              this.associado.cpf = document.forms["0"][3].value;
              this.associado.dataNascimento = new Date();///document.forms["0"][4].value).getFullYear()+"-"+new Date(document.forms["0"][4].value).getDate()+"-"+(new Date(document.forms["0"][4].value).getMonth()+1);
              this.associado.telefone = document.forms["0"][5].value;
              this.associado.celular = document.forms["0"][6].value;
              this.associado.cep = document.forms["0"][7].value;
              this.associado.logradouro = document.forms["0"][8].value;
              this.associado.numero = document.forms["0"][9].value;
              this.associado.bairro = document.forms["0"][10].value;
              this.associado.complemento = document.forms["0"][11].value;
              this.associado.ativo = document.forms["0"][12].checked;
              this.associado.excluido = false;
              console.log(JSON.stringify(this.associado));

              Broker.of("associadoServico").promise("salvarAssociado", this.associado)
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
