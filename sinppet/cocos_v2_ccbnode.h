#include "cocos2d.h"
#include "cocos-ext.h"

class <#className#>
:public cocos2d::CCNode
, public cocos2d::extension::CCBSelectorResolver
, public cocos2d::extension::CCBMemberVariableAssigner
, public cocos2d::extension::CCBAnimationManagerDelegate
{
    //関数
public:
    <#className#>();
    ~<#className#>();
    
    //override CCNode
    virtual void onEnter();
    //override custom
    virtual void onLoadCCB(cocos2d::CCNode* pParent, cocos2d::extension::CCBReader* pCCBReader);
    //CCBSelectorResolver delegate
    virtual cocos2d::SEL_MenuHandler onResolveCCBCCMenuItemSelector(CCObject* pTarget, const char* pSelectorName);
    //CCBSelectorResolver delegate
    virtual cocos2d::extension::SEL_CCControlHandler onResolveCCBCCControlSelector(cocos2d::CCObject* pTarget, const char* pSelectorName);
    //CCBMemberVariableAssigner
    virtual bool onAssignCCBMemberVariable(CCObject* pTarget, const char* pMemberVariableName, CCNode* pNode);
    //CCBAnimationManagerDelegate
    virtual void completedAnimationSequenceNamed(const char* name);
    
    //new and autorelease
    CREATE_FUNC_CH(<#className#>);
private:
    
    //変数
public:
private:
    
    
    
};
class <#className#>BuilderLoader : public cocos2d::extension::CCNodeLoader{
public:
    CCB_STATIC_NEW_AUTORELEASE_OBJECT_METHOD(<#className#>BuilderLoader, loader);
    CCB_VIRTUAL_NEW_AUTORELEASE_CREATECCNODE_METHOD_CH(<#className#>);
};