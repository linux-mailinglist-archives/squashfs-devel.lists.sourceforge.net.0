Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC68947184
	for <lists+squashfs-devel@lfdr.de>; Mon,  5 Aug 2024 00:51:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1sak4Q-0000Lm-Tr;
	Sun, 04 Aug 2024 22:51:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phillip@squashfs.org.uk>) id 1sak4P-0000Le-Gx
 for squashfs-devel@lists.sourceforge.net;
 Sun, 04 Aug 2024 22:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XYW+PkYeb8Jk186duZxpDKZafi9nJXuAmpHQfB+Cj88=; b=P0GmxHM+pN+zjwA23PKXhTCD+j
 I1WmFTfSM/0UbZZo+Yx9Y/8yMVDxzfwSlhfIp+4y9GMBUHVWc6IWxUjQQiG1gTYi/iB4SHywjUOkp
 hbLJXDM1taai08SBQg81jJWIL3icFKtqcn/ry7PHuZ8Oo+co8WaCH8803YqSQfAmDc8g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XYW+PkYeb8Jk186duZxpDKZafi9nJXuAmpHQfB+Cj88=; b=SqQ1fk9MHq3Nd/dUiu78UncYe6
 LrxFwE5HJr+ImVozhLp4VuBVvD+ez5swcW2EMCw/oos/on3ZdFiteMhKNGf7OcvXlpPzuUSMKzd7H
 76Ag5aB+5cVYYNwMARcDUeKkZYk+7JTIp1FsenV/kAUzq4JyqVshWchZUz+PJi4UrSi0=;
Received: from sxb1plsmtpa01-06.prod.sxb1.secureserver.net ([92.204.81.208])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sak4P-0008L3-ET for squashfs-devel@lists.sourceforge.net;
 Sun, 04 Aug 2024 22:51:22 +0000
Received: from [192.168.178.90] ([82.69.79.175]) by :SMTPAUTH: with ESMTPA
 id ajlcsFI3xUO4kajlcsAEzD; Sun, 04 Aug 2024 15:31:57 -0700
X-CMAE-Analysis: v=2.4 cv=N9DiFH9B c=1 sm=1 tr=0 ts=66b0015d
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=IkcTkHD0fZMA:10 a=NqGczTKSS6nHx0CtAX0A:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Message-ID: <023b6204-ad41-42e8-ad24-6d704ef3cd6c@squashfs.org.uk>
Date: Sun, 4 Aug 2024 23:31:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Al Viro <viro@zeniv.linux.org.uk>
References: <20240803040729.1677477-1-lizhi.xu@windriver.com>
 <20240803074349.3599957-1-lizhi.xu@windriver.com>
 <ee839d00-fd42-4b69-951d-8571140c077b@squashfs.org.uk>
 <20240804212034.GE5334@ZenIV>
Content-Language: en-GB
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <20240804212034.GE5334@ZenIV>
X-CMAE-Envelope: MS4xfKzl8G1K/ysKowjA1ifGdmiWVl2kBb9Ya4CQnUnSJ0U+Hgi9QSfjGMRUy6YGPPgBuj3/Y3KrNtg5ao0AhGYr1bdTcNfXPH4yLLvYtm7Ri2I0VeMTHHsN
 iNZ2uCaU1iHtiBBCmU/sDR9Ft26t+w5yLQBplFhLwVnxNc+x5LEHTcqXo7RcQdOhq6W3OUt+DBiEOYeHSoxO+L27hyfufEpMYhlRBBpdzsQsXOcgNmYgIVB/
 LrC4IUP2Iq4G2gk2+1LEpWpttW5+EFnHsbayhk0bZEsK611DuiwQas/eI4j3AleN33MV1mAsSUy53JxH75ZGpmM5gf8XKdNgheoucGO2H7XG8WNXbB/dHVUM
 Bz/PWefBkZHdtlfnVMN1IRCuWbQhPN1ixX3qtr2r5ByNk9e1D9qOlkLkoBkLoEvhWFy8LH6ccGYN3ZR6ArQY6CfWp1SCeKkwE/8tv1kWKIF36THbFqr3N0Ro
 BjQM6W2niCyzDiofufhXikNrmZo0ShP6w2PlTc6j3u9Tf66rmVp4Mi6L1YwpMNnfgK/aq1BTKVLeBqMc
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/08/2024 22:20, Al Viro wrote: > On Sun, Aug 04, 2024
 at 10:16:05PM +0100, Phillip Lougher wrote: > >> NACK. I see no reason to
 introduce an intermediate variable here. >> >> Please do what Al Vi [...]
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [92.204.81.208 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [92.204.81.208 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
X-Headers-End: 1sak4P-0008L3-ET
Subject: Re: [Squashfs-devel] [PATCH V7] squashfs: Add symlink size check in
 squash_read_inode
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: squashfs-devel@lists.sourceforge.net, brauner@kernel.org, jack@suse.cz,
 syzbot+24ac24ff58dc5b0d26b9@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 Lizhi Xu <lizhi.xu@windriver.com>, linux-fsdevel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On 04/08/2024 22:20, Al Viro wrote:
> On Sun, Aug 04, 2024 at 10:16:05PM +0100, Phillip Lougher wrote:
> 
>> NACK. I see no reason to introduce an intermediate variable here.
>>
>> Please do what Al Viro suggested.
> 
> Alternatively, just check ->i_size after assignment.  loff_t is
> always a 64bit signed; le32_to_cpu() returns 32bit unsigned.
> Conversion from u32 to s64 is always going to yield a non-negative
> result; comparison with PAGE_SIZE is all you need there.

I'm happy with that as well.

Thanks

Phillip


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
