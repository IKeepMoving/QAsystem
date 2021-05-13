package com.rance.chatui.ui.activity;

import android.content.Intent;
import android.graphics.drawable.AnimationDrawable;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.Fragment;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.jude.easyrecyclerview.EasyRecyclerView;
import com.rance.chatui.R;
import com.rance.chatui.adapter.ChatAdapter;
import com.rance.chatui.adapter.CommonFragmentPagerAdapter;
import com.rance.chatui.enity.FullImageInfo;
import com.rance.chatui.enity.MessageInfo;
import com.rance.chatui.enity.QA_pair;
import com.rance.chatui.ui.fragment.ChatEmotionFragment;
import com.rance.chatui.ui.fragment.ChatFunctionFragment;
import com.rance.chatui.util.Constants;
import com.rance.chatui.util.GlobalOnItemClickManagerUtils;
import com.rance.chatui.util.MediaManager;
import com.rance.chatui.widget.EmotionInputDetector;
import com.rance.chatui.widget.NoScrollViewPager;
import com.rance.chatui.widget.StateButton;

import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;

import java.util.ArrayList;
import java.util.List;

import butterknife.Bind;
import butterknife.ButterKnife;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

/**
 * @author Double_X on 2018/5/31
 * @version v1.0
 * @Email 12****085@qq.com
 * @describe 添加描述
 */
public class MainActivity extends AppCompatActivity {

    @Bind(R.id.chat_list)
    EasyRecyclerView chatList;
    @Bind(R.id.emotion_voice)
    ImageView emotionVoice;
    @Bind(R.id.edit_text)
    EditText editText;
    @Bind(R.id.voice_text)
    TextView voiceText;
    @Bind(R.id.emotion_button)
    ImageView emotionButton;
    @Bind(R.id.emotion_add)
    ImageView emotionAdd;
    @Bind(R.id.emotion_send)
    StateButton emotionSend;
    @Bind(R.id.viewpager)
    NoScrollViewPager viewpager;
    @Bind(R.id.emotion_layout)
    RelativeLayout emotionLayout;


    private String ss;
    private Handler hander=null;
    private String sa;

    private EmotionInputDetector mDetector;
    private ArrayList<Fragment> fragments;
    private ChatEmotionFragment chatEmotionFragment;
    private ChatFunctionFragment chatFunctionFragment;
    private CommonFragmentPagerAdapter adapter;

    private ChatAdapter chatAdapter;
    private LinearLayoutManager layoutManager;
    private List<MessageInfo> messageInfos;
    //录音相关
    int animationRes = 0;
    int res = 0;
    AnimationDrawable animationDrawable = null;
    private ImageView animView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ButterKnife.bind(this);
        EventBus.getDefault().register(this);
        initWidget();
    }

    private void initWidget() {
        fragments = new ArrayList<>();
        chatEmotionFragment = new ChatEmotionFragment();
        fragments.add(chatEmotionFragment);
        chatFunctionFragment = new ChatFunctionFragment();
        fragments.add(chatFunctionFragment);
        adapter = new CommonFragmentPagerAdapter(getSupportFragmentManager(), fragments);
        viewpager.setAdapter(adapter);
        viewpager.setCurrentItem(0);

        mDetector = EmotionInputDetector.with(this)
                .setEmotionView(emotionLayout)
                .setViewPager(viewpager)
                .bindToContent(chatList)
                .bindToEditText(editText)
                .bindToEmotionButton(emotionButton)
                .bindToAddButton(emotionAdd)
                .bindToSendButton(emotionSend)
                .bindToVoiceButton(emotionVoice)
                .bindToVoiceText(voiceText)
                .build();

        GlobalOnItemClickManagerUtils globalOnItemClickListener = GlobalOnItemClickManagerUtils.getInstance(this);
        globalOnItemClickListener.attachToEditText(editText);

        chatAdapter = new ChatAdapter(this);
        layoutManager = new LinearLayoutManager(this);
        layoutManager.setOrientation(LinearLayoutManager.VERTICAL);
        chatList.setLayoutManager(layoutManager);
        chatList.setAdapter(chatAdapter);
        chatList.setOnScrollListener(new RecyclerView.OnScrollListener() {
            @Override
            public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
                switch (newState) {
                    case RecyclerView.SCROLL_STATE_IDLE:
                        chatAdapter.handler.removeCallbacksAndMessages(null);
                        chatAdapter.notifyDataSetChanged();
                        break;
                    case RecyclerView.SCROLL_STATE_DRAGGING:
                        chatAdapter.handler.removeCallbacksAndMessages(null);
                        mDetector.hideEmotionLayout(false);
                        mDetector.hideSoftInput();
                        break;
                    default:
                        break;
                }
            }

            @Override
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                super.onScrolled(recyclerView, dx, dy);
            }
        });
        chatAdapter.addItemClickListener(itemClickListener);
        LoadData();
    }

    /**
     * item点击事件
     */
    private ChatAdapter.onItemClickListener itemClickListener = new ChatAdapter.onItemClickListener() {
        @Override
        public void onHeaderClick(int position) {
            Toast.makeText(MainActivity.this, "onHeaderClick", Toast.LENGTH_SHORT).show();
        }

        @Override
        public void onImageClick(View view, int position) {
            int location[] = new int[2];
            view.getLocationOnScreen(location);
            FullImageInfo fullImageInfo = new FullImageInfo();
            fullImageInfo.setLocationX(location[0]);
            fullImageInfo.setLocationY(location[1]);
            fullImageInfo.setWidth(view.getWidth());
            fullImageInfo.setHeight(view.getHeight());
            fullImageInfo.setImageUrl(messageInfos.get(position).getImageUrl());
            EventBus.getDefault().postSticky(fullImageInfo);
            startActivity(new Intent(MainActivity.this, FullImageActivity.class));
            overridePendingTransition(0, 0);
        }

        @Override
        public void onVoiceClick(final ImageView imageView, final int position) {
            if (animView != null) {
                animView.setImageResource(res);
                animView = null;
            }
            switch (messageInfos.get(position).getType()) {
                case 1:
                    animationRes = R.drawable.voice_left;
                    res = R.mipmap.icon_voice_left3;
                    break;
                case 2:
                    animationRes = R.drawable.voice_right;
                    res = R.mipmap.icon_voice_right3;
                    break;
            }
            animView = imageView;
            animView.setImageResource(animationRes);
            animationDrawable = (AnimationDrawable) imageView.getDrawable();
            animationDrawable.start();
            MediaManager.playSound(messageInfos.get(position).getFilepath(), new MediaPlayer.OnCompletionListener() {
                @Override
                public void onCompletion(MediaPlayer mp) {
                    animView.setImageResource(res);
                }
            });
        }
    };

    /**
     * 构造聊天数据
     */
    private void LoadData() {
        messageInfos = new ArrayList<>();

        MessageInfo messageInfo = new MessageInfo();
        messageInfo.setContent("你好，欢迎使用智能小Q");
        messageInfo.setType(Constants.CHAT_ITEM_TYPE_LEFT);
        messageInfo.setHeader("http://img.25pp.com/uploadfile/soft/images/2015/0527/20150527043208696.jpg");
        messageInfos.add(messageInfo);

        chatAdapter.addAll(messageInfos);
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void MessageEventBus(final MessageInfo messageInfo) {
        messageInfo.setHeader("http://img.dongqiudi.com/uploads/avatar/2014/10/20/8MCTb0WBFG_thumb_1413805282863.jpg");
        messageInfo.setType(Constants.CHAT_ITEM_TYPE_RIGHT);
        messageInfo.setSendState(Constants.CHAT_ITEM_SENDING);
        ss=messageInfo.getContent();
        messageInfos.add(messageInfo);
        chatAdapter.add(messageInfo);
        chatList.scrollToPosition(chatAdapter.getCount() - 1);
        new Handler().postDelayed(new Runnable() {
            public void run() {
                messageInfo.setSendState(Constants.CHAT_ITEM_SEND_SUCCESS);
                chatAdapter.notifyDataSetChanged();

            }
        }, 1500);
      new Handler().postDelayed(new Runnable() {
            public void run() {

                MessageInfo message = new MessageInfo();
                message.setContent(sa);
                Log.d("画中清风拂面",sa);
                message.setType(Constants.CHAT_ITEM_TYPE_LEFT);
                message.setHeader("http://img.25pp.com/uploadfile/soft/images/2015/0527/20150527043208696.jpg");
                messageInfos.add(message);
                chatAdapter.add(message);
                chatList.scrollToPosition(chatAdapter.getCount() - 1);
            }
        }, 2000);

        new Thread(new Runnable() {
            @Override
            public void run() {
                try{
                    String urls="http://47.94.248.204:8080/Review_QA/getAnswer"+"?question="+ss;
                    Log.d("sds","name"+urls);
                    OkHttpClient client=new OkHttpClient();
                    Request request=new Request.Builder().url(urls).build();
                    Response response= client.newCall(request).execute();
                    String responseData=response.body().string();
                   List<QA_pair> qa_pairs=parseJSONWithGSON(responseData);
                    if(qa_pairs.size()==0)
                    {
                        sa="对不起没有你想要的问题哦。";
                    }else
                    {
                        sa=qa_pairs.get(0).getAnswer();

                    }

                    Log.d("sds","name"+responseData);
                }catch (Exception e){
                    e.printStackTrace();
                }

            }
        }).start();

    }


    @Override
    public void onBackPressed() {
        if (!mDetector.interceptBackPress()) {
            super.onBackPressed();
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        ButterKnife.unbind(this);
        EventBus.getDefault().removeStickyEvent(this);
        EventBus.getDefault().unregister(this);
    }





    private List<QA_pair> parseJSONWithGSON(String jsonData){
        Gson gson=new Gson();
        List<QA_pair> qa_list=gson.fromJson(jsonData,new TypeToken<List<QA_pair>>(){}.getType());
        for(QA_pair a :qa_list){
            Log.d("sds","id+"+a.getId());
            Log.d("sds","name"+a.getAnswer());
        }
        return  qa_list;
    }


    Runnable   runnableUi=new  Runnable(){
        @Override
        public void run() {
            //更;新界面
            chatList.scrollToPosition(chatAdapter.getCount() - 1);
        }

    };
}
