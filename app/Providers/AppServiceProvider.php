<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use Laravel\Dusk\DuskServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
		Schema::defaultStringLength(191);
        if(config('app.env') === 'production') {
            \URL::forceScheme('https');
        }
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
		//Dusk qui est lequivalent du browser pour les tests, ne doit pas etre accessible en prod
		if ($this->app->environment('local', 'testing')) {
			$this->app->register(DuskServiceProvider::class);
		}
    }
}
