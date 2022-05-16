Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C413B52E338
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZj-0007KF-VJ; Fri, 20 May 2022 03:45:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nqaIV-0007j8-Bw
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 12:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o8xDKjeA5vjhnmsZaoY94PaYuZJ/k/2yUmf/Dmij7ao=; b=b6ig1OQQD8Yhr6Op0P3GWAYYPA
 uVrAqAj8Mt9nbK57UiU+CJrfjhbDoyClrD+PRuIHi0ab1sEtfIkvJNBPf9BmkV0TjUL+x09x4Zjpb
 c3pmB6qFjhSxrAGUaSFvt7A5uu3iS6JOuiT12hScg/t8JNyHPrigXjphCX99kTdfHpmw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o8xDKjeA5vjhnmsZaoY94PaYuZJ/k/2yUmf/Dmij7ao=; b=WTRKejqUhqiwcJ6HYRPIASUfND
 YwwJWQRUr7ZEVLN2GCJ58pyQ9WVTeSW/0fCLjXzPWyO/IUVJxmUmRq0kqknLOfXS1xaEqBY6nTLz0
 3P16OPax2pygZlfpiHT3jWjK4WHUlXcHCY4mIDKpOuXw8biNWNUd9aKnuLfYBG3MBSgg=;
Received: from mail-vk1-f180.google.com ([209.85.221.180])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nqaIQ-00H5jF-71
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 12:58:02 +0000
Received: by mail-vk1-f180.google.com with SMTP id e7so7459671vkh.2
 for <squashfs-devel@lists.sourceforge.net>;
 Mon, 16 May 2022 05:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o8xDKjeA5vjhnmsZaoY94PaYuZJ/k/2yUmf/Dmij7ao=;
 b=IIAZ2Vr+cKp9N/hE450cPXfGMc4W6fTjUA8NYQM8OGAxXmIn1uHumxtB8a/sB6412j
 7sdniG4owzBih4e4mPYRlB3BXJ01DS3cwu+86vHTAJNTxcICEueQB4LSBWAXb4H9CYav
 /1AyHO5SDWCl65RbUtarwktsst7MJJfImV4wA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o8xDKjeA5vjhnmsZaoY94PaYuZJ/k/2yUmf/Dmij7ao=;
 b=eZMSBmWQPqKKdh0m4lfmHxyCJ5tzKllXKr2XkaWYYBNqo57JfTi4DPXDLXbvaKHC0l
 jIrB0BuwMK91OZYA3jCwYOeRCVbXmD3aYkY5vsI9m2Qe3+2sgTK4IFk1F1YOVu+x1IQ8
 HaAorkr67/OlOjNlTncH8XvdYQ9AzjMf9bYJS30Hoh12v1vVrugVRUBLPWsZ5GqUmOTF
 wCVmNNkkoe21uaR0la10WSQHgWGh5EjTI6kdIAY//g1f9wgRopd34vyM2D0KT8X4tXil
 TQ5IWUek38UU7WBJObwts9LoHkN0hog9ArJ9Xjv8NijLnEbQ808Mn65LjALh9T/tVl8A
 0Efg==
X-Gm-Message-State: AOAM530D+ZiVyj4vTUQrLsdlnrq9UrpcyjejqlSFJD//1EnAnrg1PmP6
 QEeF7qndhcFJeSk1opyCYX20wlbzi8xnDNEjJqg1Yw==
X-Google-Smtp-Source: ABdhPJzbR154HdykUqMlOSgdS61sMbReXdsrDnc05byBsyuvClGk3qSBPM5na8t5c/P9iHuHZlbfFJyxBc7kjWU87L4=
X-Received: by 2002:a05:6122:da8:b0:331:3b30:8b40 with SMTP id
 bc40-20020a0561220da800b003313b308b40mr5898585vkb.30.1652705872210; Mon, 16
 May 2022 05:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220516105100.1412740-1-hsinyi@chromium.org>
 <20220516105100.1412740-3-hsinyi@chromium.org>
 <CAJMQK-jjNRuZFOJrd2knQHwPERaJ64pyys+14cCVyfdsP1GZSQ@mail.gmail.com>
 <YoJFOpbMYSEOGfXy@casper.infradead.org>
 <CAJMQK-iDFJGHzmJQ0VZRXL-O8MBeqLFS-b0M-6bm3ncZ4TgMJQ@mail.gmail.com>
 <YoJJvabBCTJHryGm@casper.infradead.org>
In-Reply-To: <YoJJvabBCTJHryGm@casper.infradead.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 16 May 2022 20:57:26 +0800
Message-ID: <CAJMQK-hst=6NYehj8Bw5LsSv3bqWpQ9whOdrOKEOPWe4dVz_BA@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, May 16,
 2022 at 8:55 PM Matthew Wilcox <willy@infradead.org>
 wrote: > > On Mon, May 16, 2022 at 08:47:52PM +0800, Hsin-Yi Wang wrote:
 > > On Mon, May 16, 2022 at 8:36 PM Matthew Wilcox <willy@ [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.180 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.180 listed in wl.mailspike.net]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nqaIQ-00H5jF-71
X-Mailman-Approved-At: Fri, 20 May 2022 03:45:10 +0000
Subject: Re: [Squashfs-devel] [PATCH 2/2] squashfs: implement readahead
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
 linux-kernel@vger.kernel.org, "linux-mm @ kvack . org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>,
 "squashfs-devel @ lists . sourceforge . net"
 <squashfs-devel@lists.sourceforge.net>, Hou Tao <houtao1@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On Mon, May 16, 2022 at 8:55 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, May 16, 2022 at 08:47:52PM +0800, Hsin-Yi Wang wrote:
> > On Mon, May 16, 2022 at 8:36 PM Matthew Wilcox <willy@infradead.org> wrote:
> > >
> > > On Mon, May 16, 2022 at 07:04:08PM +0800, Hsin-Yi Wang wrote:
> > > > > +       loff_t req_end = readahead_pos(ractl) + readahead_length(ractl);
> > > > > +       loff_t start = readahead_pos(ractl) &~ mask;
> > > > > +       size_t len = readahead_length(ractl) + readahead_pos(ractl) - start;
> > > > > +       struct squashfs_page_actor *actor;
> > > > > +       unsigned int nr_pages = 0;
> > > > > +       struct page **pages;
> > > > > +       u64 block = 0;
> > > > > +       int bsize, res, i, index;
> > > > > +       int file_end = i_size_read(inode) >> msblk->block_log;
> > > > > +       unsigned int max_pages = 1UL << shift;
> > > > > +
> > > > > +       readahead_expand(ractl, start, (len | mask) + 1);
> > > > > +
> > > > > +       if (readahead_pos(ractl) + readahead_length(ractl) < req_end ||
> > > > > +           file_end == 0)
> > > > > +               return;
> > >
> > > What's the first half of this condition supposed to be checking for?
> > > It seems to be checking whether readahead_expand() shrunk the range
> > > covered by the ractl, but readahead_expand() never does that, so I'm
> > > confused why you're checking for it.
> >
> > hi Matthew,
> >
> > This is to check if readahead_expand() expands as much as it's requested.
> > I didn't encounter the mismatch so far in my testing. If this check is
> > not necessary, it can be removed.
>
> Then I think req_end is miscalculated?  It should surely be:
>
>         req_end = start + (len | mask) + 1;
>
> But I'm not sure that we should be failing under such circumstances.
> For example, we may have been asked to read 1.5MB, attempt to round up
> to 2MB, and fail.  But we can still submit a readahead for the first 1MB,
> before leaving the second 512kB for readpage to handle.
>
> So maybe we should just remove this check entirely.

I'll remove this in the next version.


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
