Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF12B52E33C
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZj-0007J7-Ly; Fri, 20 May 2022 03:45:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nqa9E-0000qr-Gz
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 12:48:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tPZL+h8jcnBW8PHWzi1Lq2sdX5BxnED0XWH1cfUGZUM=; b=R79GcfLS+uYbhPyK5lvCLArgBX
 2ZgyumkKqJN3S8s0l3fL5JyW7V9N74EekUKGA73/Ds4cBedzcD7zwKHc9OnRFCDbbK3sGk4SVuxvJ
 iZ6Aa2ATopDLYXO9aIkdLoWberD7XiU7KPDb/l2Naf1pJ3WnXxGy2KsHod2/FLPtOr0Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tPZL+h8jcnBW8PHWzi1Lq2sdX5BxnED0XWH1cfUGZUM=; b=XOLeJqBHch71rCl4Rf2meN5dlc
 BGC9kIuhQpboAVtLKpQxQKXEUSv9C5qu1mVh1NT8XfrEJvMA/aq2FzOWuadydhx+NEoWW+Yh6hkyH
 mHFk4ZmriMSVns1xAX8FcICOWWM/kXo9W/rMpbfQezahS984EaIOdxWZXKu9sMuQ7SQo=;
Received: from mail-vs1-f47.google.com ([209.85.217.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nqa9A-00H51O-A4
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 12:48:28 +0000
Received: by mail-vs1-f47.google.com with SMTP id x8so15351708vsg.11
 for <squashfs-devel@lists.sourceforge.net>;
 Mon, 16 May 2022 05:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tPZL+h8jcnBW8PHWzi1Lq2sdX5BxnED0XWH1cfUGZUM=;
 b=DEZpbOgEvpT0/mw7g8WxEqnXML+QP8L1f8t8EVAx5s6EJcEal8pQJc72+LahAsseMq
 jxB1+F3/ufWv217kKKmVIIay1JoTF+vO0ReKEN4pFmokQ6DwS263F0437nEDO79rvDTg
 lLyLQLHmMI0I70TkS9sgr7H2lgaMMthSrfP3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tPZL+h8jcnBW8PHWzi1Lq2sdX5BxnED0XWH1cfUGZUM=;
 b=P4Rn0ZqqFlgZaECqpt5hXcOIueDeysndSvQVoOKd9Z0A3wR8PXGyjlTiEAg9f4u9gi
 IAH/i1SeFko81Inx55LHu+Qe9DNY3dXGVktilquluSIZacCDXneI+2W9A3bS1eX6VstM
 j/fRbgfzg8vvBl1RK6UMP3Y22NvHaqi5exsLHKeunPGmOETa+ViJboCyiGA0xT/g9BQl
 Vd5aXzrGGGUO2/iVdcrYD6+7XrT0f9LTOPsebMOxnmkx8SPQfVnN4u7/kFBznTOQna3H
 EnuMHARq1AyDGPJ4CHobgrSZNOI0UaNOgoaUYBVAO6ui24yNUewRBV5z5+1jzhPbPi5e
 Lcdg==
X-Gm-Message-State: AOAM5317S5UFm3j3J9ccIekGEQLBSfDHPvp0MXULEBmo4mPiZ/ibqA5N
 5gmHw2s6YL/okiNuClGPs+ML/6uKPfrRqYKHsE8Skg==
X-Google-Smtp-Source: ABdhPJyFGR82c/fth2bgKdRpk7amgaoBeyp1CambTvVyEA4sPHZFBf0Us5CA+S0ti98tO7thswX8hquoKaAZAoNpccU=
X-Received: by 2002:a67:d999:0:b0:335:7e5c:63d5 with SMTP id
 u25-20020a67d999000000b003357e5c63d5mr4976709vsj.69.1652705298452; Mon, 16
 May 2022 05:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220516105100.1412740-1-hsinyi@chromium.org>
 <20220516105100.1412740-3-hsinyi@chromium.org>
 <CAJMQK-jjNRuZFOJrd2knQHwPERaJ64pyys+14cCVyfdsP1GZSQ@mail.gmail.com>
 <YoJFOpbMYSEOGfXy@casper.infradead.org>
In-Reply-To: <YoJFOpbMYSEOGfXy@casper.infradead.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 16 May 2022 20:47:52 +0800
Message-ID: <CAJMQK-iDFJGHzmJQ0VZRXL-O8MBeqLFS-b0M-6bm3ncZ4TgMJQ@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, May 16,
 2022 at 8:36 PM Matthew Wilcox <willy@infradead.org>
 wrote: > > On Mon, May 16, 2022 at 07:04:08PM +0800, Hsin-Yi Wang wrote:
 > > > + loff_t req_end = readahead_pos(ractl) + readahead_ [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.217.47 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.47 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nqa9A-00H51O-A4
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

On Mon, May 16, 2022 at 8:36 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, May 16, 2022 at 07:04:08PM +0800, Hsin-Yi Wang wrote:
> > > +       loff_t req_end = readahead_pos(ractl) + readahead_length(ractl);
> > > +       loff_t start = readahead_pos(ractl) &~ mask;
> > > +       size_t len = readahead_length(ractl) + readahead_pos(ractl) - start;
> > > +       struct squashfs_page_actor *actor;
> > > +       unsigned int nr_pages = 0;
> > > +       struct page **pages;
> > > +       u64 block = 0;
> > > +       int bsize, res, i, index;
> > > +       int file_end = i_size_read(inode) >> msblk->block_log;
> > > +       unsigned int max_pages = 1UL << shift;
> > > +
> > > +       readahead_expand(ractl, start, (len | mask) + 1);
> > > +
> > > +       if (readahead_pos(ractl) + readahead_length(ractl) < req_end ||
> > > +           file_end == 0)
> > > +               return;
>
> What's the first half of this condition supposed to be checking for?
> It seems to be checking whether readahead_expand() shrunk the range
> covered by the ractl, but readahead_expand() never does that, so I'm
> confused why you're checking for it.

hi Matthew,

This is to check if readahead_expand() expands as much as it's requested.
I didn't encounter the mismatch so far in my testing. If this check is
not necessary, it can be removed.


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
