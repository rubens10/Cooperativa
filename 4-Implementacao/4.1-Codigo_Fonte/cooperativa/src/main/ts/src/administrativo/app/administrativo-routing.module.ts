import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { MainView } from './views/main/main-view.component';

import { UsuarioFormulario } from './views/usuario/usuario-formulario.component';
import { UsuarioView } from './views/usuario/usuario-view.component';
import { AssociadoFormulario } from './views/associado/associado-formulario.component';
import { AssociadoView } from './views/associado/associado-view.component';
import { FarmaciaFormulario } from './views/farmacia/farmacia-formulario.component';
import { FarmaciaView } from './views/farmacia/farmacia-view.component';
import { FuncionarioFormulario } from './views/funcionario/funcionario-formulario.component';
import { FuncionarioView } from './views/funcionario/funcionario-view.component';
import { AtendimentoFormulario } from './views/atendimento/atendimento-formulario.component';
import { AtendimentoView } from './views/atendimento/atendimento-view.component';

const routes: Routes = [
  {
    path: '',
    component: MainView
  },
  {
     path: 'usuario-formulario',
     component: UsuarioFormulario
   },
   {
      path: 'usuario-formulario/:id',
      component: UsuarioFormulario
    },
   {
     path: 'usuario-listagem',
     component: UsuarioView
   },
   {
      path: 'associado-formulario',
      component: AssociadoFormulario
    },
    {
       path: 'associado-formulario/:id',
       component: AssociadoFormulario
     },
    {
      path: 'associado-listagem',
      component: AssociadoView
    },
    {
       path: 'farmacia-formulario',
       component: FarmaciaFormulario
     },
     {
        path: 'farmacia-formulario/:id',
        component: FarmaciaFormulario
      },
     {
       path: 'farmacia-listagem',
       component: FarmaciaView
     },
     {
        path: 'funcionario-formulario',
        component: FuncionarioFormulario
      },
      {
         path: 'funcionario-formulario/:id',
         component: FuncionarioFormulario
      },
      {
        path: 'funcionario-listagem',
        component: FuncionarioView
      },
      {
         path: 'atendimento-formulario',
         component: AtendimentoFormulario
       },
       {
          path: 'atendimento-formulario/:id',
          component: AtendimentoFormulario
       },
       {
         path: 'atendimento-listagem',
         component: AtendimentoView
       },
];

/**
 *
 */
@NgModule( {
    imports: [RouterModule.forRoot( routes )],
    exports: [RouterModule],
    providers: []
})
export class AdministrativoRoutingModule
{
}
