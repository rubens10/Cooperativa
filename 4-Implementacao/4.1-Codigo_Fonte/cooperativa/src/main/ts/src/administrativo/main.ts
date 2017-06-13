import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';
import { enableProdMode } from '@angular/core';
import { environment } from '../environments/environment';
import { AdministrativoModule } from './app/administrativo.module';
import { CovalentDynamicFormsModule } from '@covalent/dynamic-forms';

if ( environment.production )
{
    enableProdMode();
}

platformBrowserDynamic().bootstrapModule( AdministrativoModule );
