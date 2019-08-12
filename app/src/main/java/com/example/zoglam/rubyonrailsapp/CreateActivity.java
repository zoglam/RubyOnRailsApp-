package com.example.zoglam.rubyonrailsapp;

import android.content.Context;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;

import uk.co.chrisjenx.calligraphy.CalligraphyConfig;
import uk.co.chrisjenx.calligraphy.CalligraphyContextWrapper;


public class CreateActivity extends AppCompatActivity {
    private int checkedProject = -1;
    private TextView tempTv;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);
        setContentView(R.layout.activity_create);



        Toolbar tb = (Toolbar)findViewById(R.id.toolbar_creation);
        tb.setNavigationIcon(R.drawable.backlcon);
        setSupportActionBar(tb);
        tb.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });



        final String[] projectsArray = getIntent().getExtras().getStringArray("projects");
        final ListView projectsList = (ListView) findViewById(R.id.list);

        ArrayAdapter<String> adapter = new ArrayAdapter<>(this, R.layout.projectlist_cell);
        adapter.addAll(projectsArray);
        projectsList.setAdapter(adapter);

        projectsList.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                if(position != checkedProject && checkedProject >= 0)
                    tempTv.setCompoundDrawablesWithIntrinsicBounds(0, 0, 0, 0);

                tempTv = ((TextView) view);
                tempTv.setCompoundDrawablesWithIntrinsicBounds(0, 0, R.drawable.done, 0);
                checkedProject = position;
            }
        });
    }

    @Override
    protected void attachBaseContext(Context newBase) {
        super.attachBaseContext(CalligraphyContextWrapper.wrap(newBase));
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu){
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()){
            case R.id.action_settings:
                finish();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
}