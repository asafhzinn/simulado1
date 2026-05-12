<?php

namespace App\Livewire\Auth;


use Illuminate\Support\Facades\Auth;
use Livewire\Component;

class Login extends Component
{
public $email;
public $password;

protected $rules = [
    'email' => 'required|email',
    'password' => 'required'
];

protected $messages = [
    'email.required' => 'Campo email obrigatorio',
    'email.email' => 'Formato de email incorreto',
    'password.required' => 'Campo senha obrigatorio'
];

public function login(){
    $this->validate();

   if (Auth::attempt(['email' => $this->email, 'password' => $this->password])){

    session()->regenerate();

    return redirect()->route('movimentacao.index');
}

    session()->flash('error', 'Email ou senha incorreto');
}


    public function render()
    {
        return view('livewire.auth.login');
    }
}
