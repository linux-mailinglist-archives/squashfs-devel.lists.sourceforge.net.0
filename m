Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA43852E350
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZl-0007OY-T0; Fri, 20 May 2022 03:45:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nrb7k-0007lp-Bt
 for squashfs-devel@lists.sourceforge.net; Thu, 19 May 2022 08:03:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/sVrKXlJiB/91I00QzAeuxvXVjT/UwmC0od05LnN4Ac=; b=Gk1fy6XnA/HdzrdPFo79lfGq0k
 cWkgnrjpMHDV8yMjlEFtB6f6sQBxvM7H0oJ8bYh5lfMbqVtNLDLOapWIhT+0pvjJ19Zz/u9MNUYfo
 bzeZiYsQXTWO57W0E6cdlQYvFIuqZ9Jq1+TQspHD0yoDxYgkvuQMyuMxasbN2DNzL4B8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/sVrKXlJiB/91I00QzAeuxvXVjT/UwmC0od05LnN4Ac=; b=A+6C3fLlomG5OSKKLyrPE1BHXc
 f210Tl4cilTmhlta5lZH8ETT8F6jwjZr4uREbb4gdbOq9+gplnk/HIQCI3pOnkpDPWR0yYddltaUE
 9FNkDw9r31QDyVhEjOEmsA2Dq6jdQA6Sr95aN4+v/9Ks9TMkb8mW2VU3pK5tc6bXQCx0=;
Received: from mail-yb1-f171.google.com ([209.85.219.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nrb7i-008YO2-0c
 for squashfs-devel@lists.sourceforge.net; Thu, 19 May 2022 08:03:06 +0000
Received: by mail-yb1-f171.google.com with SMTP id d137so7623622ybc.13
 for <squashfs-devel@lists.sourceforge.net>;
 Thu, 19 May 2022 01:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/sVrKXlJiB/91I00QzAeuxvXVjT/UwmC0od05LnN4Ac=;
 b=AC38FJV1YuWB/BkOesEaJHr3dzZ7Q+idSrisH07SMypwxIVbFNgVBSAdRRwR3tLqyk
 qfwgle2EbFIcdL92L8m3UrgASGG3WjWvXdWGzUO6PmhiMO7x/iJjuIekVu9gHlvVMtze
 7TzqphYNHEBRTsUOi381kY0v85l/9awSZo/BE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/sVrKXlJiB/91I00QzAeuxvXVjT/UwmC0od05LnN4Ac=;
 b=IqiHjjsfzxYtorPOkQoesQGQVHOIJPa3aBt8/sO3ZzKlLptAremRm1vMdAn5N6yrur
 FwN0l/WnTnLgiWudwk3QB/bZO3g14l+w5q9zmRAn60O4ulTamH1+VQcOtxk60PintlMA
 J5hzh5iNcGTU+gUqdrNfHeNaqZzhP6AucfMcCTS5ZlK5nZeJpFrlrpGxlldFKQFVb8A8
 HFnHcMH+cL+DdN7x+AMqghv5xnjBwwfAs1VdtMLKgwj+j3CbY6xsFOheHSYvg7sH/mS0
 cjhnu1POHlcAqR8Np080PJhIol9Nx7zbXIfJ/WbG3rMubfaO93aAk/xGUBE92ec4DA6H
 KELg==
X-Gm-Message-State: AOAM532IVTi3th88t2tWl1dkvIoCna2gwQEWo4xZowGfUGubYNjSzZYi
 yoJdrjLSSS0Q1N473lrioJaljZgmV7QFvc5eXX/y9HoEmmw=
X-Google-Smtp-Source: ABdhPJz4i7Oj3ex34dYsu4NsY1yNrvFQpe/Im0zienEazrsD4IFDnDjBf6pQTr/ySGIEDvbCJM5cQGeaV207VRGixJw=
X-Received: by 2002:ab0:3492:0:b0:368:b577:bfd with SMTP id
 c18-20020ab03492000000b00368b5770bfdmr1449813uar.110.1652946993961; Thu, 19
 May 2022 00:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220517082650.2005840-1-hsinyi@chromium.org>
 <20220517082650.2005840-4-hsinyi@chromium.org>
 <CAEVVKH8vJ4KZ8VX=paXdZ7Ci8rLF=nh4OA2eP96JzUDeeGEtJQ@mail.gmail.com>
In-Reply-To: <CAEVVKH8vJ4KZ8VX=paXdZ7Ci8rLF=nh4OA2eP96JzUDeeGEtJQ@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 19 May 2022 15:56:08 +0800
Message-ID: <CAJMQK-gGH=5+7EwjFUVCuv2U4H0YAPGGPkuRz+00u4hnecfgQQ@mail.gmail.com>
To: Xiongwei Song <sxwjean@gmail.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, May 17,
 2022 at 5:17 PM Xiongwei Song <sxwjean@gmail.com>
 wrote: > > On Tue, May 17, 2022 at 4:28 PM Hsin-Yi Wang <hsinyi@chromium.org>
 wrote: > > > > Implement readahead callback for squashfs [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.171 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.171 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nrb7i-008YO2-0c
X-Mailman-Approved-At: Fri, 20 May 2022 03:45:11 +0000
Subject: Re: [Squashfs-devel] [PATCH v2 3/3] squashfs: implement readahead
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
Cc: Xiongwei Song <Xiongwei.Song@windriver.com>, Zhang Yi <yi.zhang@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 "linux-mm @ kvack . org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>,
 "squashfs-devel @ lists . sourceforge . net"
 <squashfs-devel@lists.sourceforge.net>, Hou Tao <houtao1@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On Tue, May 17, 2022 at 5:17 PM Xiongwei Song <sxwjean@gmail.com> wrote:
>
> On Tue, May 17, 2022 at 4:28 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > Implement readahead callback for squashfs. It will read datablocks
> > which cover pages in readahead request. For a few cases it will
> > not mark page as uptodate, including:
> > - file end is 0.
> > - zero filled blocks.
> > - current batch of pages isn't in the same datablock or not enough in a
> >   datablock.
> > Otherwise pages will be marked as uptodate. The unhandled pages will be
> > updated by readpage later.
> >
> > Suggested-by: Matthew Wilcox <willy@infradead.org>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reported-by: Matthew Wilcox <willy@infradead.org>
> > Reported-by: Phillip Lougher <phillip@squashfs.org.uk>
> > Reported-by: Xiongwei Song <sxwjean@gmail.com>
>
> "xiongwei.song@windriver.com" too.
>
ack.
<snip>


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
