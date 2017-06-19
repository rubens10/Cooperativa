import { Component, OnInit } from '@angular/core';
import { Broker } from 'eits-ng2';
import { Router, ActivatedRoute } from '@angular/router';
import { TdDialogService } from '@covalent/core';
import { Subscription } from 'rxjs/Rx';
/**
 *
 */
@Component( {
    selector: 'AtendimentoFormulario',
    templateUrl: './atendimento-formulario.component.html'
})
export class AtendimentoFormulario
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
    atendimento:any = {};

    funcionario:any = {};
    associado:any = {};

    private situacoes:Array<any> = [
       { id: 0, nome: 'NOVO', valor: 'NOVO' },
       { id: 1, nome: 'EM ANDAMENTO', valor: 'EM_ANDAMENTO' },
       { id: 2, nome: 'PENDENTE', valor: 'PENDENTE' },
       { id: 3, nome: 'AGUARDANDO ACEITE', valor: 'AGUARDANDO_ACEITE' },
       { id: 4, nome: 'FINALIZADO', valor: 'FINALIZADO' },
     ];

    private assuntos:Array<any> = [
       { id: 0, nome: 'CONSULTORIA', valor: 'CONSULTORIA' },
       { id: 1, nome: 'ORÇAMENTO DE COMPRA', valor: 'ORCAMENTO_DE_COMPRA' },
       { id: 2, nome: 'INSUMOS', valor: 'INSUMOS' },
     ];

    private funcionarios:Array<any> = [];

    private associados:Array<any> = [];

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
       Broker.of("atendimentoServico").promise("buscarAtendimentoPorId", this.id)
           .then( (result) => {
               this.atendimento = result;
               this.funcionario = this.atendimento.funcionario.id;
               this.associado = this.atendimento.associado.id;

               /*var novaDataObj = new Date(this.atendimento.dataPrevisao.getTime());
               novaDataObj.setDate(20);
               console.log(this.atendimento.dataPrevisao + " ==> "+novaDataObj)
               this.atendimento.dataPrevisao = novaDataObj;*/
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
      this.carregarFuncionario();
      this.carregarAssociado();
    }

    ngOnDestroy(){
      this.inscricao.unsubscribe();
    }

    carregarFuncionario(){
      Broker.of("funcionarioServico").promise("buscarFuncionariosPorFiltros", "")
            .then( (result) => {
              this.funcionarios = result["content"];
              //console.log(JSON.stringify(this.funcionarios));
            })
            .catch( (message) => {
              this._dialogService.openAlert({
                message: message,
                title: 'Alerta',
                closeButton: 'OK',
              });
            });
    }

    carregarAssociado(){
      Broker.of("associadoServico").promise("buscarAssociadosPorFiltros", "")
            .then( (result) => {
              this.associados = result["content"];
              //console.log(JSON.stringify(this.funcionarios));
            })
            .catch( (message) => {
              this._dialogService.openAlert({
                message: message,
                title: 'Alerta',
                closeButton: 'OK',
              });
            });
    }

    private voltarListagem(){
      this.router.navigate(['/atendimento-listagem']);
    }

    public onSalvar():void
    {
      this.atendimento.dataPrevisao = new Date(this.atendimento.dataPrevisao+" 12:00:00 GMT");
      this.atendimento.dataConclusao = new Date(this.atendimento.dataConclusao+" 12:00:00 GMT");

      console.log("associado: "+JSON.stringify(this.funcionario));
      console.log(JSON.stringify(this.atendimento));
      Broker.of("atendimentoServico").promise(((this.id > 0) ? "alterar" : "inserir") + "Atendimento", this.atendimento, this.funcionario, this.associado)
            .then( (result) => {
              console.log(result);
              this.atendimento = result;
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
          Broker.of("atendimentoServico").promise("removerAtendimento", this.id)
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
