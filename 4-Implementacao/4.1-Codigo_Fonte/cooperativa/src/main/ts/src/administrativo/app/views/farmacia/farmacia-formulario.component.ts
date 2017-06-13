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
    elements: ITdDynamicElementConfig[];
    excluirRegistro:Boolean;
    farmacia:any = {};

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
      this.router.navigate(['/farmacia-listagem']);
    }

    private criarFormulario(){
      console.log(JSON.stringify(this.farmacia));

      this.elements = [
        {
          name: 'id',
          label: 'ID',
          default: this.farmacia.id,
          type: TdDynamicElement.Input,
          required: false,
        },
        {
          name: 'razaoSocial',
          label: 'Razão Social',
          default: this.farmacia.razaoSocial,
          type: TdDynamicElement.Input,
          required: true,
        },
        {
          "name": "nomeFantasia",
          "label": "Nome Fantasia",
          default: this.farmacia.nomeFantasia,
          "type": TdDynamicElement.Input,
          "required": true
        },
        {
          "name": "cnpj",
          "label": "CNPJ",
          default: this.farmacia.cnpj,
          "type": TdDynamicElement.Input,
          required: true,
        },
        {
          "name": "inscricaoEstadual",
          "label": "Inscrição Estadual",
          default: this.farmacia.inscricaoEstadual,
          "type": TdDynamicElement.Input,
          required: true,
        },
        {
          "name": "telefone",
          "label": "Telefone",
          default: this.farmacia.telefone,
          "type": TdDynamicElement.Input,
          required: true,
        },
        {
          "name": "email",
          "label": "E-mail",
          default: this.farmacia.email,
          "type": TdDynamicElement.Input,
          required: false,
        },
        {
          "name": "cep",
          "label": "CEP",
          default: this.farmacia.cep,
          "type": TdDynamicElement.Input,
          required: true,
        },
        {
          "name": "logradouro",
          "label": "Logradouro",
          default: this.farmacia.logradouro,
          "type": TdDynamicElement.Input,
          required: true,
        },
        {
          "name": "numero",
          "label": "Número",
          default: this.farmacia.numero,
          "type": TdDynamicElement.Input,
          required: true,
        },
        {
          "name": "bairro",
          "label": "Bairro",
          default: this.farmacia.bairro,
          "type": TdDynamicElement.Input,
          required: true,
        },
        {
          "name": "complemento",
          "label": "Complemento",
          default: this.farmacia.complemento,
          "type": TdDynamicElement.Input,
          required: false,
        },
        {
          "name": "informacaoComplementar",
          "label": "Informação Complementar",
          default: this.farmacia.informacaoComplementar,
          "type": TdDynamicElement.Input,
          required: false,
        },
        {
          "name": "ativo",
          "label": "Ativo",
          default: this.farmacia.ativo,
          "type": TdDynamicType.Boolean
        },
      ];

      //document.forms["0"][0].readOnly = true; // ID somente leitura
    }

    public onSalvar():void
    {
      if(document.forms["0"].className.indexOf('ng-valid') > 0) {
        Broker.of("farmaciaServico").promise("getInstancia")
            .then( (result) => {
              this.farmacia = result;
              this.farmacia.id = (this.id > 0) ? this.id : 0;
              this.farmacia.razaoSocial = document.forms["0"][1].value;
              this.farmacia.nomeFantasia = document.forms["0"][2].value;
              this.farmacia.cnpj = document.forms["0"][3].value;
              this.farmacia.inscricaoEstadual = document.forms["0"][4].value;
              this.farmacia.telefone = document.forms["0"][5].value;
              this.farmacia.email = document.forms["0"][6].value;
              this.farmacia.cep = document.forms["0"][7].value;
              this.farmacia.logradouro = document.forms["0"][8].value;
              this.farmacia.numero = document.forms["0"][9].value;
              this.farmacia.bairro = document.forms["0"][10].value;
              this.farmacia.complemento = document.forms["0"][11].value;
              this.farmacia.informacaoComplementar = document.forms["0"][12].value;
              this.farmacia.ativo = document.forms["0"][13].checked;
              this.farmacia.excluido = false;
              console.log(JSON.stringify(this.farmacia));

              Broker.of("farmaciaServico").promise("salvarFarmacia", this.farmacia)
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
