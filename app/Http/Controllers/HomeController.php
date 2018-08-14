<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
Use App\User;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('home');
    }

     public function activate($token = null)
    {
        $user = User::where('token', $token)->first();
       
        if (empty($user)) {
            return redirect()->to('/')
                ->with(['error' => 'Your activation code is either expired or invalid.']);
        }

        $user->update(['token' => null, 'is_verified' =>User::is_verified]);

        return redirect()->route('home')
            ->with(['success' => 'Congratulations! your account is now activated.']);
    }
}
