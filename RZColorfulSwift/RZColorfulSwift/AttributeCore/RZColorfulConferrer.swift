//
//  RZColorfulConferrer.swift
//  RZColorfulSwift
//
//  Created by 若醉 on 2018/7/9.
//  Copyright © 2018年 rztime. All rights reserved.
//

import UIKit

public class RZColorfulConferrer : NSObject {
    private var texts = NSMutableArray.init()
        
    /// 文字
    @discardableResult
    public func text(_ text:String?) ->  RZTextAttribute?{
        if text?.count == 0 || text == nil {
            return nil;
        }
        let attribute = RZTextAttribute.init()
        attribute.text = text!
        
        self.texts.add(attribute)
        return attribute
    }
    
    /// 图片 可以设置bounds
    @discardableResult
    public func image(_ image:UIImage?) -> RZImageAttribute? {
        if image == nil {
            return nil;
        }
        let attribute = RZImageAttribute.init()
        attribute.image = image;
        
        self.texts.add(attribute)
        return attribute;
    }
    
    /// url图片 可以设置size，maxSize
    @discardableResult
    public func imageByUrl(_ imageUrl:String?) -> RZImageUrlAttribute? {
        if imageUrl?.count == 0 || imageUrl == nil {
            return nil;
        }
        let attribute = RZImageUrlAttribute.init()
        attribute.imageByUrl = imageUrl;

        self.texts.add(attribute)
        return attribute;
    }
    /// 富文本（如网页源码）
    @discardableResult
    public func htmlString(_ htmlString:String?) -> RZHtmlAttribute? {
        if htmlString?.count == 0 || htmlString == nil {
            return nil;
        }
        let attribute = RZHtmlAttribute.init()
        attribute.htmlText(htmlString)
        
        self.texts.add(attribute)
        return attribute;
    }
    
    private var _paragraphStyle : RZColorfulConferrerParagraphStyle?
    /// 段落
    public var paragraphStyle : RZColorfulConferrerParagraphStyle? {
        get {
            if _paragraphStyle == nil {
                _paragraphStyle = RZColorfulConferrerParagraphStyle.init()
                _paragraphStyle!.and = self
            }
            return _paragraphStyle
        }
    }
    
    private var _shadow : RZColorfulConferrerShadowStyle?
    /// 阴影
    public var shadow : RZColorfulConferrerShadowStyle? {
        get {
            if _shadow == nil {
                _shadow = RZColorfulConferrerShadowStyle.init()
                _shadow!.and = self
            }
            return _shadow
        }
    }
    
    func confer() -> NSAttributedString? {
        let text = NSMutableAttributedString.init()
        texts .forEach { (_t) in
            var attr : NSMutableAttributedString?
            if _t is RZTextAttribute {
                let __t = _t as! RZTextAttribute
                attr = __t.package(_paragraphStyle?.paragraph, _shadow?.shadow)?.mutableCopy() as? NSMutableAttributedString
            } else if _t is RZImageAttribute {
                let __t = _t as! RZImageAttribute
                attr = __t.package(_paragraphStyle?.paragraph)?.mutableCopy() as? NSMutableAttributedString
            } else if _t is RZImageUrlAttribute {
                let __t = _t as! RZImageUrlAttribute
                attr = __t.package()?.mutableCopy() as? NSMutableAttributedString
            } else if _t is RZHtmlAttribute {
                let __t = _t as! RZHtmlAttribute
                attr = __t.package()?.mutableCopy() as? NSMutableAttributedString
            }
            if attr != nil {
                text.append(attr!)
            }
        }
        texts.removeAllObjects()
        return text
    }
}
