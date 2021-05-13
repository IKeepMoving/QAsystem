package com.rance.chatui.ui.activity;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;

import com.rance.chatui.R;

public class LanucherActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_lanucher);
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                //在主线程中运行
                startMainActivity();
            }
        }, 2000);
    }
    private void startMainActivity() {
        Intent intent=new Intent(this,LoginActivity.class);
        startActivity(intent);
        finish();


    }
}
