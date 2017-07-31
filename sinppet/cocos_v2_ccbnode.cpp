USING_NS_CC;
USING_NS_CC_EXT;

<#className#>::<#className#>()
//: ccbBtn1_(0)
{
    
}

<#className#>::~<#className#>(){
    //    CC_SAFE_RELEASE(ccbBtn1_);
}

void <#className#>::onLoadCCB(CCNode* pParent, CCBReader* pCCBReader) {
    //    CCNodeLoaderLibrary* ccNodeLoaderLibrary = pCCBReader->getNodeLoaderLibrary();
    //    ccNodeLoaderLibrary->registerCCNodeLoader("CCBファイル名/クラス名", CCBPartsListPickerBuilderLoader::loader());
}

void <#className#>::onEnter(){
    CCNode::onEnter();
}

SEL_MenuHandler <#className#>::onResolveCCBCCMenuItemSelector(CCObject* pTarget, const char* pSelectorName) {
    
    return NULL;
}

SEL_CCControlHandler <#className#>::onResolveCCBCCControlSelector(CCObject* pTarget, const char* pSelectorName) {
    //    CCB_SELECTORRESOLVER_CCCONTROL_GLUE(this, "cardBtnClicked:", CCBPartsContainerCard::cardBtnClicked);
    return NULL;
}
bool <#className#>::onAssignCCBMemberVariable(CCObject* pTarget, const char* pMemberVariableName, CCNode* pNode) {
    //    CCB_MEMBERVARIABLEASSIGNER_GLUE(this, "ccbBtn1_", CCControlButton*, ccbBtn1_);
    return true;
}

void <#className#>::completedAnimationSequenceNamed(const char* name) {
    
}