import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule, CUSTOM_ELEMENTS_SCHEMA, NO_ERRORS_SCHEMA } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CovalentCoreModule, CovalentLayoutModule } from '@covalent/core';
import { CovalentDynamicFormsModule } from '@covalent/dynamic-forms';

import { AdministrativoRoutingModule } from './administrativo-routing.module';

import { MainView } from './views/main/main-view.component';

import { UsuarioView } from './views/usuario/usuario-view.component';
import { UsuarioFormulario } from './views/usuario/usuario-formulario.component';
import { AssociadoFormulario } from './views/associado/associado-formulario.component';
import { AssociadoView } from './views/associado/associado-view.component';
import { FarmaciaFormulario } from './views/farmacia/farmacia-formulario.component';
import { FarmaciaView } from './views/farmacia/farmacia-view.component';
import { FuncionarioFormulario } from './views/funcionario/funcionario-formulario.component';
import { FuncionarioView } from './views/funcionario/funcionario-view.component';
import { AtendimentoFormulario } from './views/atendimento/atendimento-formulario.component';
import { AtendimentoView } from './views/atendimento/atendimento-view.component';
/**
 *
 */

@NgModule( {
    declarations: [
        MainView,
        UsuarioView,
        UsuarioFormulario,
        AssociadoView,
        AssociadoFormulario,
        FarmaciaView,
        FarmaciaFormulario,
        FuncionarioView,
        FuncionarioFormulario,
        AtendimentoView,
        AtendimentoFormulario,
    ],
    imports: [
        CovalentCoreModule.forRoot(),
        CovalentLayoutModule.forRoot(),
        BrowserModule,
        FormsModule,
        AdministrativoRoutingModule,
        CovalentDynamicFormsModule,
        BrowserAnimationsModule
    ],
    schemas: [
      CUSTOM_ELEMENTS_SCHEMA,
      NO_ERRORS_SCHEMA
    ],
    providers: [],
    bootstrap: [MainView]
})
export class AdministrativoModule
{
    /*-------------------------------------------------------------------
     *                           ATTRIBUTES
     *-------------------------------------------------------------------*/
}
